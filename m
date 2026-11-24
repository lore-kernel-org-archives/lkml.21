Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560731;
	b=ZKU3uUyqrXPJUyrXJQxdZErMhzN2QUqg3qtoI0Z8u9EbcLBPEIMUdQHFmf6hFIE/hTS1
	 GdDzUZ5YLbDZ8sG4egPwM8nT/rFTvUre2Pj0Hi9vYkGjjdn+APu2r3FBtgYwDtk2WlBPU
	 9OZGBi0X9SoYK18XTKCObG4NTwvmvgup/8ypU4ShQfdi7GVgFPmVHiuW8t01hF0R5UlHa
	 E9bIbt0nInwXoSA8wL1afnTxHi2yyXcQFOuTr8/bgTlCtKyo/fNr61Clqq9kB9dYt+Eq9
	 fppacitz3ioov4dMT9A2YnQCfdlBHANpB7ksupsBlk9wYC3dLpB3/ij+a9ldeiGMyIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560731;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9MXaMKC8mSA9uN31fXRXNsQDreYatABHholCpeAoLlQ=;
	b=YEJVn5UIsdJfe9QpzJ+GRVaXdAPg3nMIYRVmJKLptSIieMwNWVPbcACdkfJoTuQ5wJ2k
	 zmnpSLxRJy+JwG5/wRF1aSUnpbhzKQFie0I6VgsPFabgAVQMaraDtZWgUrwHrg+LJw2Zp
	 o/PCyNkgDU494kmMt496LBM5Ox5XB41ejHl32u9ck3HX1bV4bBGigTqeCM3KEjyEskQ7C
	 0+VgD1Z2+oFZJh1GgMfVbiRLaMGMLtOpPIUeAA2KYjiyyvil1bJ8udCKsixuvG4NGI4R5
	 C8Zia5lVFQiBEGArqGkReZ/Dq6Hh4K9OBfJuvy/xaRvFXJEsbzj0qEQacTUxg9N3JcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8r5OWRj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E554C606A326
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n8r5OWRj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41C911F000C0;
	Tue, 24 Nov 2026 22:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795560730;
	bh=9MXaMKC8mSA9uN31fXRXNsQDreYatABHholCpeAoLlQ=;
	h=From:To:Cc:Subject:Date;
	b=n8r5OWRjzayf0wSvXijiJHXSgal6t32O8HOxuGxM4lOm/7Y/Zdm/0SzZvuVbwGZJb
	 Np5OVWIFOlFlKvKy/MwZ4DneZUqopzVSGX888o8Z2xr438EAR9dsJrZG+l39O1VULH
	 HYdSYcZEZVPMASdSx2F/ZlqbJEoEPPJfSXupF0qqAClI/MqEEm/jZirMmwR0zazlRr
	 sFza4zPKHa5R++Sw179WJBp0prThlp+cxag+QK9xjCV3Sa4FKJ15IIWJ2iQFvoj0+z
	 Q3lOZGd9ST0zWY5+z538N029yRiP4SZZhGnQENeX601AbVGdCstEklpLthXLNDRQSf
	 tSFH6tekeeJBQ==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>, Zhu Jun <zhujun2@cmss.chinamobile.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kernel@vger.kernel.org
Subject: [GIT PULL] bootconfig: Fixes for v7.4-rc5
Date: Wed, 25 Nov 2026 07:52:07 +0900
Message-ID: <undine-1795560727343817219-0253da6e82c1cf34@undined.local>
X-Mailer: UndineD 0.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Bootconfig fixes for v7.4-rc5:

- bootconfig: Exclude alignment padding from bootconfig max size
  Separate the padded trailer size limit from XBC_DATA_MAX and strip up to
  3 trailing NUL alignment bytes before xbc_init() so valid max-size
  configs are not rejected depending on initrd alignment.

- bootconfig: Free the initrd memory used by bootconfig
  Save the original initrd_end before trimming the bootconfig and restore
  it when freeing initrd memory so pages previously occupied by bootconfig
  data are not leaked.

- bootconfig: Parser fixes and tests according to LEAN check
  . Fix xbc_verify_tree() to check subkeys of valued keys
    Use xbc_node_get_subkey() when descending so subkeys under mixed
    value+subkey nodes cannot bypass XBC_DEPTH_MAX and XBC_KEYLEN_MAX.
  . Fix xbc_node_compose_key_after() for value nodes
    Walk parent pointers across chained array value nodes before checking
    @root so composed keys exclude array values and NUL-terminate @buf.
  . Avoid out-of-bounds pointer arithmetic in xbc_snprint_cmdline_filter()
    Pass NULL to snprintf() when len >= size so buf + len is not formed
    past the buffer end on overflow.
  . Add tests for unclosed brace position and mixed-kv limits
    Expand test-bootconfig.sh to cover unclosed brace error positions and
    mixed value+subkey depth and key-length limits.

- tools/bootconfig: Use registered global tracing parameter names
  Update boottime-trace.rst and ftrace2bconf.sh to use the registered
  global tracing parameter names, while keeping fallback support in
  bconf2ftrace.sh for existing configs.

- tools/bootconfig: Fix read/write error handling in bootconfig tool
  . Reject short reads of configuration data in load_xbc_fd() and free the
    allocated buffer on failure so partial reads are never parsed or
    checksummed.
  . Check write() return values for negative errors before comparing
    against unsigned size_t counts so initrd append failures are reported.

Please pull the latest bootconfig-fixes-v7.4-rc5 tree, which can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace.git
bootconfig-fixes-v7.4-rc5

Tag SHA1: 5aaf5e882e3d5a9940b5183554e260523f5fee41
Head SHA1: 56bb11fe6aacc7666938e8e6765b44aa0cf1fcdd


Eduardo Mucelli Rezende Oliveira (1):
      tools/bootconfig: Use the registered global tracing parameter names

Masami Hiramatsu (Google) (6):
      bootconfig: Exclude alignment padding from bootconfig max size
      bootconfig: Free the initrd memory used by bootconfig
      bootconfig: Fix xbc_verify_tree() to check subkeys of valued keys
      bootconfig: Fix xbc_node_compose_key_after() for value nodes
      bootconfig: Avoid out-of-bounds pointer arithmetic in xbc_snprint_cmdline_filter()
      tools/bootconfig: Add tests for unclosed brace position and mixed-kv limits

Zhu Jun (2):
      tools/bootconfig: Reject short reads of configuration data
      tools/bootconfig: Report initrd append failures

----
 Documentation/trace/boottime-trace.rst   |  8 ++---
 include/linux/bootconfig.h               | 24 +++++++++++++++
 include/linux/initrd.h                   |  2 ++
 init/initramfs.c                         | 10 +++++++
 init/main.c                              | 31 ++++++++++++++------
 lib/bootconfig.c                         | 17 ++++++-----
 tools/bootconfig/main.c                  | 38 +++++++++++++++---------
 tools/bootconfig/scripts/bconf2ftrace.sh | 21 ++++++++++----
 tools/bootconfig/scripts/ftrace2bconf.sh |  5 ++--
 tools/bootconfig/test-bootconfig.sh      | 50 ++++++++++++++++++++++++++++++--
 10 files changed, 163 insertions(+), 43 deletions(-)
---------------------------
diff --git a/Documentation/trace/boottime-trace.rst b/Documentation/trace/boottime-trace.rst
index 2c3c1fedb92c..68fd6152cd0f 100644
--- a/Documentation/trace/boottime-trace.rst
+++ b/Documentation/trace/boottime-trace.rst
@@ -36,20 +36,20 @@ these options are passed as a part of kernel legacy command line.
 kernel.tp_printk
    Output trace-event data on printk buffer too.
 
-kernel.dump_on_oops [= MODE]
+kernel.ftrace_dump_on_oops [= MODE]
    Dump ftrace on Oops. If MODE = 1 or omitted, dump trace buffer
    on all CPUs. If MODE = 2, dump a buffer on a CPU which kicks Oops.
 
 kernel.traceoff_on_warning
    Stop tracing if WARN_ON() occurs.
 
-kernel.fgraph_max_depth = MAX_DEPTH
+kernel.ftrace_graph_max_depth = MAX_DEPTH
    Set MAX_DEPTH to maximum depth of fgraph tracer.
 
-kernel.fgraph_filters = FILTER[, FILTER2...]
+kernel.ftrace_graph_filter = FILTER[, FILTER2...]
    Add fgraph tracing function filters.
 
-kernel.fgraph_notraces = FILTER[, FILTER2...]
+kernel.ftrace_graph_notrace = FILTER[, FILTER2...]
    Add fgraph non-tracing function filters.
 
 
diff --git a/include/linux/bootconfig.h b/include/linux/bootconfig.h
index 260a6f46042e..f745068c07cd 100644
--- a/include/linux/bootconfig.h
+++ b/include/linux/bootconfig.h
@@ -63,6 +63,30 @@ struct xbc_node {
 #define XBC_VALUE	(1 << 15)
 /* Maximum size of boot config is 32KB - 1 */
 #define XBC_DATA_MAX	(XBC_VALUE - 1)
+/* Maximum size of padded boot config in initrd trailer */
+#define XBC_DATA_MAX_PADDED	(XBC_DATA_MAX + BOOTCONFIG_ALIGN - 1)
+
+/**
+ * xbc_exclude_padding() - Exclude trailing null padding bytes from size
+ * @data: Bootconfig data (including padding).
+ * @size: The size of @data from the bootconfig footer.
+ *
+ * Exclude up to BOOTCONFIG_ALIGN - 1 trailing null padding bytes while
+ * keeping the terminal null byte of the bootconfig data, and return the
+ * unpadded bootconfig size.
+ */
+static inline __init uint32_t xbc_exclude_padding(const char *data, uint32_t size)
+{
+	int i;
+
+	for (i = 0; i < BOOTCONFIG_ALIGN - 1; i++) {
+		if (size <= 1 || data[size - 1] != '\0' || data[size - 2] != '\0')
+			break;
+		size--;
+	}
+
+	return size;
+}
 
 #define XBC_NODE_MAX	8192
 #define XBC_KEYLEN_MAX	256
diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index 7e5d26c8136f..3086a462da76 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -17,6 +17,8 @@ extern unsigned long initrd_start, initrd_end;
 extern void free_initrd_mem(unsigned long, unsigned long);
 
 #ifdef CONFIG_BLK_DEV_INITRD
+/* initrd_end before trailing data (e.g. bootconfig) was trimmed off */
+extern unsigned long initrd_mem_end;
 extern void __init reserve_initrd_mem(void);
 extern void wait_for_initramfs(void);
 #else
diff --git a/init/initramfs.c b/init/initramfs.c
index ebddde9c8f0d..11030cc1f35d 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -582,6 +582,7 @@ char * __init unpack_to_rootfs(char *buf, unsigned long len)
 }
 
 static int __initdata do_retain_initrd;
+unsigned long initrd_mem_end __initdata;
 
 static int __init retain_initrd_param(char *str)
 {
@@ -750,6 +751,15 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 		security_initramfs_populated();
 	}
 
+	/*
+	 * The bootconfig loader trims the bootconfig off initrd_end. Restore
+	 * it to free the memory used by the bootconfig too, unless the initrd
+	 * is retained (which must not expose the bootconfig).
+	 */
+	if (!do_retain_initrd && initrd_start && initrd_end < initrd_mem_end)
+		initrd_end = initrd_mem_end;
+	initrd_mem_end = 0;
+
 	/*
 	 * If the initrd region is overlapped with crashkernel reserved region,
 	 * free only memory that is not part of crashkernel region.
diff --git a/init/main.c b/init/main.c
index 7b0c8c34e6a9..f14780345051 100644
--- a/init/main.c
+++ b/init/main.c
@@ -268,7 +268,7 @@ early_param("loglevel", loglevel);
 #ifdef CONFIG_BLK_DEV_INITRD
 static void * __init get_boot_config_from_initrd(size_t *_size)
 {
-	u32 size, csum;
+	u32 size, raw_size, csum;
 	char *data;
 	u8 *hdr;
 	int i;
@@ -294,29 +294,42 @@ static void * __init get_boot_config_from_initrd(size_t *_size)
 	if ((unsigned long)hdr < initrd_start)
 		return NULL;
 
-	size = get_unaligned_le32(hdr);
+	raw_size = get_unaligned_le32(hdr);
 	csum = get_unaligned_le32(hdr + 4);
 
-	if (size > XBC_DATA_MAX) {
+	if (raw_size > XBC_DATA_MAX_PADDED) {
 		pr_err("bootconfig size %u is greater than max size %d\n",
-			size, XBC_DATA_MAX);
+			raw_size, XBC_DATA_MAX);
 		return NULL;
 	}
 
-	if (size > ((unsigned long)hdr - initrd_start)) {
+	if (raw_size > ((unsigned long)hdr - initrd_start)) {
 		pr_err("bootconfig size %u is greater than initrd size %lu\n",
-			size, initrd_end - initrd_start);
+			raw_size, initrd_end - initrd_start);
 		return NULL;
 	}
 
-	data = ((void *)hdr) - size;
+	data = ((void *)hdr) - raw_size;
+
+	size = xbc_exclude_padding(data, raw_size);
+	if (size > XBC_DATA_MAX) {
+		pr_err("bootconfig size %u is greater than max size %d\n",
+			size, XBC_DATA_MAX);
+		return NULL;
+	}
 
-	if (xbc_calc_checksum(data, size) != csum) {
+	if (xbc_calc_checksum(data, raw_size) != csum) {
 		pr_err("bootconfig checksum failed\n");
 		return NULL;
 	}
 
-	/* Remove bootconfig from initramfs/initrd */
+	/*
+	 * Remove bootconfig from initramfs/initrd. Since the initrd memory
+	 * (including the bootconfig) is freed with initrd_end, save the
+	 * original end to free the whole region later.
+	 */
+	if (!initrd_mem_end)
+		initrd_mem_end = initrd_end;
 	initrd_end = (unsigned long)data;
 	if (_size)
 		*_size = size;
diff --git a/lib/bootconfig.c b/lib/bootconfig.c
index 948c8c10e4b9..9ae9a215b1da 100644
--- a/lib/bootconfig.c
+++ b/lib/bootconfig.c
@@ -421,12 +421,12 @@ int __init xbc_node_compose_key_after(struct xbc_node *root,
 	uint16_t keys[XBC_DEPTH_MAX];
 	int depth = 0, ret = 0, total = 0;
 
+	while (node && xbc_node_is_value(node))
+		node = xbc_node_get_parent(node);
+
 	if (!node || node == root)
 		return -EINVAL;
 
-	if (xbc_node_is_value(node))
-		node = xbc_node_get_parent(node);
-
 	while (node && node != root) {
 		if (depth == XBC_DEPTH_MAX)
 			return -ERANGE;
@@ -587,8 +587,8 @@ int __init xbc_snprint_cmdline_filter(char *buf, size_t size, struct xbc_node *r
 
 		vnode = xbc_node_get_child(knode);
 		if (!vnode) {
-			ret = snprintf(buf ? buf + len : NULL, rest(len, size),
-				       "%s ", xbc_namebuf);
+			ret = snprintf(buf && len < size ? buf + len : NULL,
+				       rest(len, size), "%s ", xbc_namebuf);
 			if (ret < 0)
 				return ret;
 			len += ret;
@@ -601,7 +601,8 @@ int __init xbc_snprint_cmdline_filter(char *buf, size_t size, struct xbc_node *r
 			 * whitespace.
 			 */
 			q = strpbrk(val, " \t\r\n") ? "\"" : "";
-			ret = snprintf(buf ? buf + len : NULL, rest(len, size),
+			ret = snprintf(buf && len < size ? buf + len : NULL,
+				       rest(len, size),
 				       "%s=%s%s%s ", xbc_namebuf, q, val, q);
 			if (ret < 0)
 				return ret;
@@ -1058,8 +1059,8 @@ static int __init xbc_verify_tree(void)
 			return xbc_parse_error("Too long key length",
 				xbc_node_get_data(n));
 
-		m = xbc_node_get_child(n);
-		if (m && xbc_node_is_key(m)) {
+		m = xbc_node_get_subkey(n);
+		if (m) {
 			n = m;
 			depth++;
 			if (depth > XBC_DEPTH_MAX)
diff --git a/tools/bootconfig/main.c b/tools/bootconfig/main.c
index d3f840c5adce..c85e58fcb6b0 100644
--- a/tools/bootconfig/main.c
+++ b/tools/bootconfig/main.c
@@ -182,7 +182,7 @@ static int load_xbc_fd(int fd, char **buf, int size)
 {
 	int ret;
 
-	if (size < 0 || size > XBC_DATA_MAX)
+	if (size < 0 || size > XBC_DATA_MAX_PADDED)
 		return -EINVAL;
 
 	*buf = malloc(size + 1);
@@ -190,8 +190,12 @@ static int load_xbc_fd(int fd, char **buf, int size)
 		return -ENOMEM;
 
 	ret = read(fd, *buf, size);
-	if (ret < 0)
-		return -errno;
+	if (ret != size) {
+		ret = ret < 0 ? -errno : -EIO;
+		free(*buf);
+		*buf = NULL;
+		return ret;
+	}
 	(*buf)[size] = '\0';
 
 	return ret;
@@ -237,7 +241,7 @@ static int load_xbc_from_initrd(int fd, char **buf)
 {
 	struct stat stat;
 	int ret;
-	uint32_t size = 0, csum = 0, rcsum;
+	uint32_t size = 0, data_size, csum = 0, rcsum;
 	char magic[BOOTCONFIG_MAGIC_LEN];
 
 	ret = fstat(fd, &stat);
@@ -269,7 +273,7 @@ static int load_xbc_from_initrd(int fd, char **buf)
 	csum = le32toh(csum);
 
 	/* Wrong size error  */
-	if (size > XBC_DATA_MAX ||
+	if (size > XBC_DATA_MAX_PADDED ||
 	    size > stat.st_size - BOOTCONFIG_FOOTER_SIZE) {
 		pr_err("bootconfig size is too big\n");
 		return -E2BIG;
@@ -283,6 +287,12 @@ static int load_xbc_from_initrd(int fd, char **buf)
 	if (ret < 0)
 		return ret;
 
+	data_size = xbc_exclude_padding(*buf, size);
+	if (data_size > XBC_DATA_MAX) {
+		pr_err("bootconfig size is too big\n");
+		return -E2BIG;
+	}
+
 	/* Wrong Checksum */
 	rcsum = xbc_calc_checksum(*buf, size);
 	if (csum != rcsum) {
@@ -290,7 +300,7 @@ static int load_xbc_from_initrd(int fd, char **buf)
 		return -EINVAL;
 	}
 
-	ret = init_xbc_with_error(*buf, size);
+	ret = init_xbc_with_error(*buf, data_size);
 
 	return ret < 0 ? ret : size;
 }
@@ -499,14 +509,16 @@ static int apply_xbc(const char *path, const char *xbc_path)
 	total_size = size + BOOTCONFIG_FOOTER_SIZE;
 
 	ret = write(fd, data, total_size);
-	if (ret < total_size) {
-		if (ret < 0)
-			ret = -errno;
+	if (ret < 0) {
+		ret = -errno;
 		pr_err("Failed to apply a boot config: %d\n", ret);
-		if (ret >= 0)
-			goto out_rollback;
-	} else
-		ret = 0;
+		goto out;
+	}
+	if ((size_t)ret != total_size) {
+		pr_err("Failed to apply a boot config: %d\n", ret);
+		goto out_rollback;
+	}
+	ret = 0;
 
 out:
 	close(fd);
diff --git a/tools/bootconfig/scripts/bconf2ftrace.sh b/tools/bootconfig/scripts/bconf2ftrace.sh
index 850c2073433e..ba29f7411f62 100755
--- a/tools/bootconfig/scripts/bconf2ftrace.sh
+++ b/tools/bootconfig/scripts/bconf2ftrace.sh
@@ -275,15 +275,26 @@ setup_instance() { # [instance]
 }
 
 # ftrace global configs (kernel.*)
-if xbc_has_key "kernel.dump_on_oops"; then
-	dump_mode=`xbc_get_val "kernel.dump_on_oops" 1`
+# Prefer the kernel parameter names and accept the old script keys as fallbacks.
+dump_key=kernel.ftrace_dump_on_oops
+xbc_has_key "$dump_key" || dump_key=kernel.dump_on_oops
+if xbc_has_key "$dump_key"; then
+	dump_mode=`xbc_get_val "$dump_key" 1`
 	[ "$dump_mode" ] && dump_mode=`eval echo $dump_mode` || dump_mode=1
 	run_cmd "echo \"$dump_mode\" > /proc/sys/kernel/ftrace_dump_on_oops"
 fi
 
-set_value_of kernel.fgraph_max_depth $TRACEFS/max_graph_depth
-set_array_of kernel.fgraph_filters $TRACEFS/set_graph_function
-set_array_of kernel.fgraph_notraces $TRACEFS/set_graph_notrace
+graph_depth_key=kernel.ftrace_graph_max_depth
+xbc_has_key "$graph_depth_key" || graph_depth_key=kernel.fgraph_max_depth
+set_value_of "$graph_depth_key" $TRACEFS/max_graph_depth
+
+graph_filter_key=kernel.ftrace_graph_filter
+xbc_has_key "$graph_filter_key" || graph_filter_key=kernel.fgraph_filters
+set_array_of "$graph_filter_key" $TRACEFS/set_graph_function
+
+graph_notrace_key=kernel.ftrace_graph_notrace
+xbc_has_key "$graph_notrace_key" || graph_notrace_key=kernel.fgraph_notraces
+set_array_of "$graph_notrace_key" $TRACEFS/set_graph_notrace
 
 # Per-instance/per-event configs
 if ! xbc_has_branch "ftrace" ; then
diff --git a/tools/bootconfig/scripts/ftrace2bconf.sh b/tools/bootconfig/scripts/ftrace2bconf.sh
index 8eed445c295e..f62372adbfd5 100755
--- a/tools/bootconfig/scripts/ftrace2bconf.sh
+++ b/tools/bootconfig/scripts/ftrace2bconf.sh
@@ -46,10 +46,11 @@ emit_kv() { # key =|+= value
 
 global_options() {
 	val=`cat $TRACEFS/max_graph_depth`
-	[ $val != 0 ] && emit_kv kernel.fgraph_max_depth = $val
+	[ $val != 0 ] && emit_kv kernel.ftrace_graph_max_depth = $val
 	if grep -qv "^#" $TRACEFS/set_graph_function $TRACEFS/set_graph_notrace ; then
 		cat 1>&2 << EOF
-# WARN: kernel.fgraph_filters and kernel.fgraph_notrace are not supported, since the wild card expression was expanded and lost from memory.
+# WARN: Cannot export kernel.ftrace_graph_filter and kernel.ftrace_graph_notrace.
+# Only the expanded function list is available.
 EOF
 	fi
 }
diff --git a/tools/bootconfig/test-bootconfig.sh b/tools/bootconfig/test-bootconfig.sh
index f584f7637e12..a93a40d11d27 100755
--- a/tools/bootconfig/test-bootconfig.sh
+++ b/tools/bootconfig/test-bootconfig.sh
@@ -118,10 +118,23 @@ dd if=/dev/urandom bs=768 count=32 | base64 -w0 >> $TEMPCONF
 printf "\"\n" >> $TEMPCONF
 xfail $BOOTCONF -a $TEMPCONF $INITRD
 
+dd if=$TEMPCONF of=$OUTFILE bs=1 count=32765
+cp $OUTFILE $TEMPCONF
+printf "\"\n" >> $TEMPCONF	# 32767 bytes + terminal ('\0') = 32768 (> max)
+xfail $BOOTCONF -a $TEMPCONF $INITRD
+
 dd if=$TEMPCONF of=$OUTFILE bs=1 count=32764
 cp $OUTFILE $TEMPCONF
-printf "\"\n" >> $TEMPCONF	# add 2 bytes + terminal ('\"\n\0')
-xpass $BOOTCONF -a $TEMPCONF $INITRD
+printf "\"\n" >> $TEMPCONF	# add 2 bytes + terminal ('\"\n\0') = 32767
+# Test max size across all 4 alignment paddings (0..3 bytes)
+for sz in 4096 4097 4098 4099; do
+  dd if=/dev/zero of=$INITRD bs=1 count=$sz 2>/dev/null
+  xpass $BOOTCONF -a $TEMPCONF $INITRD
+  $BOOTCONF -l $INITRD > $OUTFILE
+  xpass cmp $TEMPCONF $OUTFILE
+  xpass $BOOTCONF -d $INITRD
+  xpass test $(wc -c < $INITRD) -eq $sz
+done
 
 echo "Adding same-key values"
 cat > $TEMPCONF << EOF
@@ -220,6 +233,39 @@ xpass $BOOTCONF -a $TEMPCONF $INITRD
 $BOOTCONF $INITRD > $OUTFILE
 xpass grep -q "value" $OUTFILE
 
+echo "Unclosed brace error position"
+cat > $TEMPCONF << EOF
+a {
+  b = 1
+}
+c {
+  d = 2
+EOF
+echo > $INITRD
+
+xfail $BOOTCONF -a $TEMPCONF $INITRD
+$BOOTCONF -a $TEMPCONF $INITRD > $OUTFILE 2>&1
+xpass grep -q "Brace.is.not.closed.at.4:1" $OUTFILE
+$BOOTCONF -a samples/bad-tree.bconf $INITRD > $OUTFILE 2>&1
+xpass grep -q "Brace.is.not.closed.at.2:1" $OUTFILE
+
+echo "Mixed value and subkey depth/length limits"
+cat > $TEMPCONF << EOF
+k1 = v1
+k1.k2.k3.k4.k5.k6.k7.k8.k9.k10.k11.k12.k13.k14.k15.k16.k17 = v2
+EOF
+xfail $BOOTCONF -a $TEMPCONF $INITRD
+
+awk '
+BEGIN {
+  printf("root = v\nroot.")
+  for (i = 0; i < 255; i += 1)
+      printf("a")
+  printf(" = v2\n")
+}
+' > $TEMPCONF
+xfail $BOOTCONF -a $TEMPCONF $INITRD
+
 echo "=== expected failure cases ==="
 for i in samples/bad-* ; do
   xfail $BOOTCONF -a $i $INITRD

-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

