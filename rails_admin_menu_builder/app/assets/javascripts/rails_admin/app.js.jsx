var MenuTree = React.createClass({
  getDefaultProps: function() {
    return {
      nodes: [],
      updateTree: {}
    };
  },
  handleShowTree: function() {
    return this.props.nodes.map(function(node) {
      if (node.children.length > 0) {
        return <MenuDropdownItem data={node} removeItem={this.props.removeItem} />;
      } else {
        return <MenuItem data={node} removeItem={this.props.removeItem}/>;
      }
    }.bind(this))
  },
  render: function() {
    return (
      <div className="panel panel-default">
        <div className="panel-heading">
          Trier le menu
        </div>

        <div className="panel-body">
          <div className="dd menu-builder">
            <ol className="dd-list">
              {this.handleShowTree()}
            </ol>
          </div>
        </div>

        <div className="panel-footer">
          <button
            className="add_links_to_menu btn btn-primary pull-right"
            type="submit"
            onClick={this.props.updateTree}>
            Terminer <i className="fa fa-arrow-right">
          </i>
        </button>
      </div>
    </div>
  )
}
});

var MenuItem = React.createClass({
  getDefaultProps: function() {
    return {
      data: [],
    };
  },
  render: function() {
    return (
      <li
        className="dd-item dd3-item"
        data-id={this.props.data.id}
        data-type={this.props.data.node_type}>
        <div className="dd-handle dd3-handle">Drag</div>
        <div className="dd3-content">
          <strong>{this.props.data.node_type}</strong> | {this.props.data.title}
        </div>
      </li>
    );
  }
});

var MenuDropdownItem = React.createClass({
  getDefaultProps: function() {
    return {
      data: [],
      removeItem: {},
    };
  },
  render: function() {
    return (
      <li
      className="dd-item dd3-item"
      data-id={this.props.data.id}
      data-type={this.props.data.node_type}>
      <div className="dd-handle dd3-handle">Drag</div>
      <div className="dd3-content">
        <strong>{this.props.data.node_type}</strong> | {this.props.data.title}
      </div>
      <ol className="dd-list">
        {this.props.data.children.map(function(node, i){
          if (node.children.length > 0) {
            return <MenuDropdownItem data={node} removeItem={this.props.removeItem} />;
          } else {
            return <MenuItem data={node} removeItem={this.props.removeItem} />
          }
        }.bind(this))}
      </ol>
    </li>
    );
  }
});

var App = React.createClass({
  getInitialState: function() {
    return {
      nodes: [],
    };
  },
  updateTree: function() {
    var serialized = $('.menu-builder').nestable('serialize');
    $.ajax({
      type: 'POST',
      url: window.location.href,
      cache: false,
      data: {update: true, nodes: serialized},
      success: function(data) {
        location.reload();
      }.bind(this),
      error: function(xhr, status, err) {
      }
    });
  },
  componentDidMount: function() {
    $.ajax({
      type: 'POST',
      url: window.location.href,
      cache: false,
      data: {show: true},
      success: function(data) {
        this.setState({
          nodes: data.result.nodes,
        });
        $('.menu-builder').nestable();
      }.bind(this),
      error: function(xhr, status, err) {
      }
    });
  },
  render: function() {
    return (
      <div>
        <div className="row">
          <div className="col-sm-12">
            <MenuTree nodes={this.state.nodes} updateTree={this.updateTree} handleUpdate={this.handleUpdate}/>
          </div>
        </div>
    </div>
    );
  }
});

ReactDOM.render(
  <App />,
  document.getElementById('app')
);
