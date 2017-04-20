<script type="text/javascript">
  window.Carnival = {
    init: function(options) {
      var xmlhttp,
        _this = this;
      Carnival.setOptions(options);
      xmlhttp = new XMLHttpRequest();
      xmlhttp.onreadystatechange = function() {
        var n;
        if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
          n = document.createElement('div');
          n.innerHTML = xmlhttp.responseText;
          document.body.appendChild(n);
          return Carnival.replaceScriptsRecurse(n);
        }
      };
      xmlhttp.open('GET', 'https://carnivalapp.io/sites/640/embed?t=' + Math.random(), true);
      return xmlhttp.send();
    },
    setOptions: function(options) {
      var defaults, property, _results;
      window.CarnivalOptions = options || {};
      defaults = {
        enabled: true,
        article_author: '',
        article_selector: 'article',
        block_selector: ':scope > p, :scope > pre',
        onNewComment: function(comment) {}
      };
      _results = [];
      for (property in defaults) {
        if (!(property in CarnivalOptions)) {
          _results.push(CarnivalOptions[property] = defaults[property]);
        } else {
          _results.push(void 0);
        }
      }
      return _results;
    },
    replaceScriptsRecurse: function(node) {
      var child, script, _i, _len, _ref;
      if (Carnival.isScriptNode(node)) {
        script = document.createElement('script');
        script.src = node.src;
        node.parentNode.replaceChild(script, node);
      } else {
        _ref = node.childNodes;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          child = _ref[_i];
          Carnival.replaceScriptsRecurse(child);
        }
      }
      return node;
    },
    isScriptNode: function(node) {
      return node.getAttribute && node.tagName === 'SCRIPT';
    }
  };
  document.addEventListener("DOMContentLoaded", Carnival.init);
</script>

