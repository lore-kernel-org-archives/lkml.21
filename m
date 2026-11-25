Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572379;
	b=sfqkb12S+PZ0SnKWYD0oAb7E+Yu36MB7TVMEDzhXtalxG5j1GqvWVu3/TnVaKuhAhpNG
	 YU7u/8Im8Ems9r+MpIwYE+3tDtfHuhcfYYQ2/TrxWwuvzWbBqibm59q6n/QHA2vcnemv0
	 7YqLYnnVXSV0uTQsPR+X5PeaScvooVW411PpEeh79UsCsnG+VQ6eKZSu7JlMvxLvQzN2M
	 rqCYys4db6tuPyoZsAoMlH65GJiRhP1afICu4HWUWGeUzqx3ur7tSmiGP9HIRjZLAtnCi
	 wmhvoX0v2IUuB6zrGH9j7xNuRPxY/7g1btja3XKKjMyOzeRyROHlyn8+PSc5x9kzOow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572379;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=UFlNF8Yv+Mo62WTz5ycW9zpFq537oQNK+1dnxgIuFFg=;
	b=21qcyV+GpPNY8eq8d1SZyW98P/U9V+n5BvUcs2fr8a+5u3AYqbzB6Ms9tkSOExpOFY0I
	 N416kCXrIsf+oaDtiGNBOpt6qkSa3XFZnVYKe0p7IiYzgJOI11l76u5ZKsACDuN76nWdL
	 gAe1RRqCG56hotiMasziJfETX4AbtnYtk73F4Xiqe+W8TquwCPJqLKyR4QLz9yRKL3hlQ
	 PpnFPB81TTg/KSMtuz0C7A4WN7o7bOtWIjMZ04Qmv0C2KaUqSrnYQzHM4fJ3XvLYR0qic
	 h9voEtO0vfNmIDuoLw3EMzRORt1Et+/RnuAmLh45x056HHJ3CiwT5lBJVHWKf9U9Dyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCkOvamY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF889606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SCkOvamY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E05F41F000C0;
	Wed, 25 Nov 2026 02:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795572379;
	bh=UFlNF8Yv+Mo62WTz5ycW9zpFq537oQNK+1dnxgIuFFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SCkOvamYxKval+/1/KX8SE6JmVGx63HirZkeS9eTWnriz/gq1iV5HrF/++4jG9cRx
	 /xVPo9qLi74E8pyqApvKr+TSjqrjJyx715wOZ+0D0Jt3WK1C3BRSTByVcJnYGePDZ0
	 /mAZVKFn1Fw2425eyMo6lcempqYVFGUO7jZBGVxLyZrRHrYTIhsGB2+1KXrfCkXSpt
	 G3Ze9tHYHcng3pgP9TFsrAyzz1ndnzvqoht5n9CAc85FrgEvznycVxKs7tmzm5wrIp
	 aiS03G8Rcwk1MYqRMbAtuK6OpPb26RDFPeGkbQPOOaqYBk6NY6PafNCiEahAJdU6Vu
	 IJcBXflHjaiEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Chuck Wolber <chuck@wolber.net>,
	Dmitry Vyukov <dvyukov@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	kasan-dev@googlegroups.com,
	Marco Elver <elver@google.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Oberparleiter <oberpar@linux.ibm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: [PATCH v3 03/19] coverage: add a common debugfs interface
Date: Tue, 24 Nov 2026 21:05:47 -0500
Message-ID: <20261125020603.3934222-4-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125020603.3934222-1-sashal@kernel.org>
References: <20261125020603.3934222-1-sashal@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each coverage implementation creates its own top-level debugfs entry
with its own conventions: /sys/kernel/debug/gcov/ and
/sys/kernel/debug/kcov. Give them a common root,
/sys/kernel/debug/coverage/, which contains:

  backend  name of the selected code coverage measurement implementation
  gcov     symlink to ../gcov when gcov is enabled
  kcov     symlink to ../kcov when KCOV is enabled

backend is only present when a code coverage measurement implementation
is selected, so a kernel with only KCOV just has the kcov symlink. The
data formats are defined by the respective toolchains and stay
implementation specific. The existing paths are kept as they are, since
lcov, distribution tooling and syzkaller rely on them.

The selected implementation keeps its files in the directory of the
same name, which also contains a reset file that resets all of its
coverage data, as /sys/kernel/debug/gcov/reset already does for gcov.
Tools find both through the name in backend.

Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 MAINTAINERS                |  8 +++++++
 kernel/coverage/Makefile   |  1 +
 kernel/coverage/core.c     | 47 ++++++++++++++++++++++++++++++++++++++
 kernel/coverage/coverage.h | 22 ++++++++++++++++++
 kernel/coverage/gcov/fs.c  |  7 ++++++
 kernel/coverage/kcov.c     |  3 +++
 6 files changed, 88 insertions(+)
 create mode 100644 kernel/coverage/core.c
 create mode 100644 kernel/coverage/coverage.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 06caae6d28cf5..77a0f2aef0de4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6633,6 +6633,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/coda.yaml
 F:	drivers/media/platform/chips-media/coda
 
+CODE COVERAGE
+M:	Sasha Levin <sashal@kernel.org>
+S:	Maintained
+F:	kernel/coverage/Kconfig
+F:	kernel/coverage/Makefile
+F:	kernel/coverage/core.c
+F:	kernel/coverage/coverage.h
+
 CODE OF CONDUCT
 M:	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 S:	Supported
diff --git a/kernel/coverage/Makefile b/kernel/coverage/Makefile
index a4cd8cc18d9bc..881fada442bd1 100644
--- a/kernel/coverage/Makefile
+++ b/kernel/coverage/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(or $(CONFIG_COVERAGE_KERNEL),$(CONFIG_KCOV)) += core.o
 obj-$(CONFIG_GCOV_KERNEL) += gcov/
 obj-$(CONFIG_KCOV) += kcov.o
 
diff --git a/kernel/coverage/core.c b/kernel/coverage/core.c
new file mode 100644
index 0000000000000..4ece6fb295024
--- /dev/null
+++ b/kernel/coverage/core.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common debugfs interface of the kernel's code coverage implementations.
+ *
+ * /sys/kernel/debug/coverage/ is the root for all of them. The selected
+ * code coverage measurement implementation registers itself as the
+ * backend, which provides the "backend" file, and keeps its own files,
+ * including "reset", in the directory named after it.
+ */
+
+#include <linux/debugfs.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/seq_file.h>
+
+#include "coverage.h"
+
+static struct dentry *coverage_root;
+static const struct coverage_backend *coverage_backend;
+
+struct dentry *coverage_debugfs_root(void)
+{
+	return coverage_root;
+}
+
+static int backend_show(struct seq_file *m, void *unused)
+{
+	seq_puts(m, coverage_backend->name);
+	if (coverage_backend->features)
+		seq_printf(m, " %s", coverage_backend->features);
+	seq_putc(m, '\n');
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(backend);
+
+void __init coverage_register_backend(const struct coverage_backend *backend)
+{
+	coverage_backend = backend;
+	debugfs_create_file("backend", 0444, coverage_root, NULL, &backend_fops);
+}
+
+static int __init coverage_init(void)
+{
+	coverage_root = debugfs_create_dir("coverage", NULL);
+	return 0;
+}
+fs_initcall(coverage_init);
diff --git a/kernel/coverage/coverage.h b/kernel/coverage/coverage.h
new file mode 100644
index 0000000000000..f565b245b1e60
--- /dev/null
+++ b/kernel/coverage/coverage.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _KERNEL_COVERAGE_H
+#define _KERNEL_COVERAGE_H
+
+struct dentry;
+
+/**
+ * struct coverage_backend - code coverage measurement implementation
+ * @name: name reported by /sys/kernel/debug/coverage/backend. The backend keeps
+ *	its files in /sys/kernel/debug/coverage/<name>/, which must contain a
+ *	"reset" file that resets all of its coverage data when written to.
+ * @features: optional space separated list of enabled features
+ */
+struct coverage_backend {
+	const char *name;
+	const char *features;
+};
+
+struct dentry *coverage_debugfs_root(void);
+void coverage_register_backend(const struct coverage_backend *backend);
+
+#endif /* _KERNEL_COVERAGE_H */
diff --git a/kernel/coverage/gcov/fs.c b/kernel/coverage/gcov/fs.c
index 764918570de13..fe1b85d54ede0 100644
--- a/kernel/coverage/gcov/fs.c
+++ b/kernel/coverage/gcov/fs.c
@@ -28,6 +28,7 @@
 #include <linux/seq_file.h>
 #include <linux/mm.h>
 #include "gcov.h"
+#include "../coverage.h"
 
 /**
  * struct gcov_node - represents a debugfs entry
@@ -859,6 +860,10 @@ void gcov_event(enum gcov_action action, struct gcov_info *info)
 	mutex_unlock(&node_lock);
 }
 
+static const struct coverage_backend gcov_backend = {
+	.name	= "gcov",
+};
+
 /* Create debugfs entries. */
 static __init int gcov_fs_init(void)
 {
@@ -874,6 +879,8 @@ static __init int gcov_fs_init(void)
 	 */
 	debugfs_create_file("reset", 0600, root_node.dentry, NULL,
 			    &gcov_reset_fops);
+	debugfs_create_symlink("gcov", coverage_debugfs_root(), "../gcov");
+	coverage_register_backend(&gcov_backend);
 	/* Replay previous events to get our fs hierarchy up-to-date. */
 	gcov_enable_events();
 	return 0;
diff --git a/kernel/coverage/kcov.c b/kernel/coverage/kcov.c
index 9402227bd7ba8..54071af990eec 100644
--- a/kernel/coverage/kcov.c
+++ b/kernel/coverage/kcov.c
@@ -27,6 +27,8 @@
 #include <linux/log2.h>
 #include <asm/setup.h>
 
+#include "coverage.h"
+
 #define kcov_debug(fmt, ...) pr_debug("%s: " fmt, __func__, ##__VA_ARGS__)
 
 /* Number of 64-bit words written per one comparison: */
@@ -1180,6 +1182,7 @@ static int __init kcov_init(void)
 	 * use of debugfs_create_file_unsafe() is actually safe here.
 	 */
 	debugfs_create_file_unsafe("kcov", 0600, NULL, NULL, &kcov_fops);
+	debugfs_create_symlink("kcov", coverage_debugfs_root(), "../kcov");
 
 #ifdef CONFIG_KCOV_SELFTEST
 	selftest();
-- 
2.53.0

