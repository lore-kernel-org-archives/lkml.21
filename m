Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168128;
	b=WNZCuIka9UKl+UJlcVKreVq8mQyzyRyFFAXzpFIbGAmW8LxsDYC2oB/LIE/p0h3oqsaM
	 lYanJzkUPHZieYXPeKp/+bID8bXFkjYosrXHyxEj674gRbn58FqPpnn+owRBNisqthZDc
	 QoVztj+0q+ybo+/sZGVuv8UsWGvmwGAGflpW4s01UhloIZdykQwtcy+MPOWNne3oLQ3+U
	 9ueNyFMZT4wL6dss/3o55v55W4oRkKf/4RPhPjeeH+8s8ILqhOleBha2949cfcaUCi5sZ
	 dSzB5swI7BZvVDTHIpxs3+udl+cf2lgMdUkLAhdlNgZ2rFjXpWlwGlWlqHE4BVUjoRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pG1syAWkXyA+HZuarn4jRiXMHoXZPQlA/kG8cNGoNts=;
	b=L7QDFzf2AzHJ1KJK0NxNsZjX5gj49aF3qCvv+2kZqKz6ADMm/ySRMnQWLQVMfwaiZHz0
	 P+sH+6CvWAaMuXoEHrqjCPdPJ0eXfA2b14AOIik0MBW2yNy/4tK36TyX0xfWat0ZRVw3P
	 Cslu+oLuDvZd/eJXlgV9RgKGwkpVilYI/limVOitDGVa1UjmimAtuimtLstv4ZKvOuas8
	 FYC/lowFEqEOSGmBWrn4S8LZSlFzWCDfDUpVUHMsLhCDzf6Y3wn/n6pcO8sWIR3mPRR/h
	 eoihQDy/dY+BGrSr9QFRQsaI9+SKSw8FFsPKW0qQpiJX0vJU8hI4KuEPILDhPOow3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RObCYml7;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C36606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 09:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C36606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RObCYml7
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso4467565e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795168125; x=1795772925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pG1syAWkXyA+HZuarn4jRiXMHoXZPQlA/kG8cNGoNts=;
        b=RObCYml7Zk/bXP5jsr/v7ADqd9akqncDBN0/4ojTwXrr0GLtb1S0F45ybAofj7uXfr
         IwNhdw5YnSX+e6xuHvF1NIwr9zFvHgpdIwRYN1UPIcb0B55h06i6a6yTCjBQZTewXJOj
         eCESYHrIs9RGy0PVB+YIRwofPSOmxAVppD8/9xgAzXwjS7rG3GlVetG/TPIy633gn6eX
         ZpJabn96Z6lUjdcI316WjfoC8yIqKZKGJt8wTm5eLlhgRG+0QYnj9HlG4lg/4lkLsvgs
         8KWVFJ7NXcEaBJYJhpq7FNYeMyPSbAHQzkALQE810a2jQwSBFas6lkexAzLxj74ktyi6
         pbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795168125; x=1795772925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pG1syAWkXyA+HZuarn4jRiXMHoXZPQlA/kG8cNGoNts=;
        b=yKbedYPjE2PMg8iIIb1+p+Gfl6+K+1bJHxg2CGE85OTpftwYGWRKQu4u7WtywELIIi
         lOfdjRFwDIfOKr+sMFNyR7NuoHmr+Gv8Qsl33LUP9youhHpxEu5wS7ufYc95Fr/jTqOE
         BVfNsNbK0+fXFc2OdnRCz8tCLzRx/EydZfoVnPcOnSht+UHNxEoF3LEn+LpkyfOSfP3O
         TJ+8tf2EuglaY0Xv76i60RhBVM0FmzKmyH/s0fcGR3x6BRM0FVU6dFtZPdFE1AhH60Tk
         ooxBmahm+lw7zW0vLJU2ffNmS7kN4q2Hnj5TTEVk+RzDnfVHBixdK0UXJHl1xJviTGN8
         saBw==
X-Forwarded-Encrypted: i=1; AL+hErH2ow5/eBn7ijctG03lOJqib3Xp19YVkrxfYI34c3dBBGzTfu30qaHoZJU/5XTKh2f+RhHSQb6j5goNXkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zqQ+RsP4KeBKO1OWx/Pr6NWQQ+7WWs5T2m4tBeBjyI8kbgYPq
	+9WOItQt5yj4doTw7PbXZB6NRlyWTsxgFenvd+8YWvdTNu68kCgnsavh
X-Gm-Gg: AYBFou3jIS1/titcd8OI+TgQqIC5L45DaSdO0BqOn+6porO5fp6GsBWYELR1eRqiB6w
	X3ih0RTRyJUCTJkkOIE3ao/hpReo1JN+VnWmwu57GH01NPix1XtOzrbtv1zGwngmoLsOajeTTfI
	wY1qq+oziG8L2dZsSlvbB/+lKG5h91qsbKydvbKWDysbMpAqMDIhrYyuinlYBBzelumu9cILXfJ
	AY6TflzM6UifNnyO96R6ND21Oe+KqsH3r/W/REklkZiL5JtimXv7cdQ4sFEMlrf+lIlTKYkUzKw
	d/CoRz75PImfa7pqgRZHC2DfMK+K2uGGKJhEa9pUfx/es828C6VBSReQWjTXX3nOm8PejsIcM/h
	v+fFvz7SJy6Elq+PXUYicrJlWpqdJ4ssBEspDfSnMRAHf2mkfQWn43/9v6WUXm8ACA5ZPG2gxnk
	FF2+nV6iWkKCWi2TimXv3Wor5uKBXSngBaiwkPYfhH79sDCoChlkAnT+mKcY9XjABBGqlLos2U/
	0EVdJg3dMcJaAHBtTg18AwVq/oIwgSiwIlksvfMBus0pAgznikhE/In6Yj2DBbN9ITokKhGxByP
	Yi3cvUG5J7uMAatjs/xeNENyDo4Eg8GxJ4ZibmeL06M=
X-Received: by 2002:a05:600c:3b91:b0:4bb:7e4e:de53 with SMTP id 5b1f17b1804b1-4bb8881059bmr59889335e9.12.1795168125331;
        Fri, 20 Nov 2026 01:48:45 -0800 (PST)
Received: from dell-desktop ([2a02:587:4b42:1400:8199:c552:2b9e:c33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f635ffsm45137535e9.4.2026.11.20.01.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 01:48:44 -0800 (PST)
From: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
To: linux-security-module@vger.kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com,
	brauner@kernel.org,
	viro@zeniv.linux.org.uk,
	jack@suse.cz,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kpsingh@kernel.org,
	matt@bobrowski.net,
	eddyz87@gmail.com,
	tasos.papagiannnis@gmail.com
Subject: [RFC PATCH 2/2] selftests/bpf: Test pathname open enforcement
Date: Fri, 20 Nov 2026 11:48:20 +0200
Message-ID: <20261120094820.11929-3-tasos.papagiannnis@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120094820.11929-1-tasos.papagiannnis@gmail.com>
References: <20261120094820.11929-1-tasos.papagiannnis@gmail.com>
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

Verify that the hook sees the raw symlink pathname and the dirfd base.
Check denials before creation and truncation and on O_PATH and O_TMPFILE
opens. Check that -ECHILD makes the VFS retry the open with references.

Signed-off-by: Anastasios Papagiannis <tasos.papagiannnis@gmail.com>
---
 .../selftests/bpf/prog_tests/file_open_name.c | 103 ++++++++++++++++++
 .../selftests/bpf/progs/file_open_name.c      |  56 ++++++++++
 2 files changed, 159 insertions(+)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/file_open_name.c
 create mode 100644 tools/testing/selftests/bpf/progs/file_open_name.c

diff --git a/tools/testing/selftests/bpf/prog_tests/file_open_name.c b/tools/testing/selftests/bpf/prog_tests/file_open_name.c
new file mode 100644
index 000000000000..553e8c9e75f7
--- /dev/null
+++ b/tools/testing/selftests/bpf/prog_tests/file_open_name.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <test_progs.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include "file_open_name.skel.h"
+
+static void check_open(struct file_open_name *skel, int dfd, const char *name,
+		       int flags, mode_t mode, int error)
+{
+	int fd, saved_errno;
+
+	skel->bss->calls = 0;
+	skel->bss->rcu_calls = 0;
+	skel->bss->deny = error != 0;
+	skel->bss->check_enabled = true;
+	fd = openat(dfd, name, flags, mode);
+	saved_errno = errno;
+	skel->bss->check_enabled = false;
+
+	if (error) {
+		ASSERT_EQ(fd, -1, "deny open");
+		ASSERT_EQ(saved_errno, error, "open errno");
+	} else {
+		ASSERT_OK_FD(fd, "allow open");
+	}
+	if (fd >= 0)
+		close(fd);
+	ASSERT_GT(skel->bss->calls, 0, "hook count");
+	ASSERT_STREQ(skel->bss->pathname, name, "raw pathname");
+	ASSERT_EQ(skel->bss->observed_flags & flags, flags, "open flags");
+	ASSERT_EQ(skel->bss->observed_mode & 0777, mode, "creation mode");
+}
+
+void test_file_open_name(void)
+{
+	char dir[] = "/tmp/file_open_name.XXXXXX";
+	struct file_open_name *skel = NULL;
+	int dfd = -1, fd = -1;
+	struct stat st;
+
+	if (!ASSERT_OK_PTR(mkdtemp(dir), "mkdtemp"))
+		return;
+	dfd = open(dir, O_RDONLY | O_DIRECTORY);
+	if (!ASSERT_OK_FD(dfd, "open directory"))
+		goto out;
+	fd = openat(dfd, "target", O_CREAT | O_RDWR, 0600);
+	if (!ASSERT_OK_FD(fd, "create target"))
+		goto out;
+	if (!ASSERT_EQ(write(fd, "data", 4), 4, "write target"))
+		goto out;
+	if (!ASSERT_OK(symlinkat("target", dfd, "alias"), "symlink"))
+		goto out;
+
+	skel = file_open_name__open_and_load();
+	if (!ASSERT_OK_PTR(skel, "open and load"))
+		goto out;
+	if (!ASSERT_OK(stat("/proc/self/ns/pid", &st), "stat PID namespace"))
+		goto out;
+	skel->bss->pidns_dev = st.st_dev;
+	skel->bss->pidns_ino = st.st_ino;
+	skel->bss->monitored_tgid = getpid();
+	if (!ASSERT_OK(file_open_name__attach(skel), "attach"))
+		goto out;
+
+	if (test__start_subtest("raw_symlink")) {
+		check_open(skel, dfd, "./alias", O_RDONLY, 0, 0);
+		if (ASSERT_OK(fstat(dfd, &st), "stat base"))
+			ASSERT_EQ(skel->bss->base_ino, st.st_ino, "dirfd base inode");
+	}
+
+	if (test__start_subtest("deny_create")) {
+		check_open(skel, dfd, "new", O_CREAT | O_RDWR, 0600, EPERM);
+		ASSERT_EQ(fstatat(dfd, "new", &st, 0), -1, "file not created");
+		ASSERT_EQ(errno, ENOENT, "missing file");
+	}
+	if (test__start_subtest("deny_truncate")) {
+		check_open(skel, dfd, "target", O_WRONLY | O_TRUNC, 0, EPERM);
+		if (ASSERT_OK(fstat(fd, &st), "stat target"))
+			ASSERT_EQ(st.st_size, 4, "file not truncated");
+	}
+	if (test__start_subtest("deny_o_path"))
+		check_open(skel, dfd, "alias", O_PATH, 0, EPERM);
+	if (test__start_subtest("deny_tmpfile"))
+		check_open(skel, dfd, ".", O_TMPFILE | O_RDWR, 0600, EPERM);
+	if (test__start_subtest("rcu_retry")) {
+		skel->bss->require_ref = true;
+		check_open(skel, dfd, "target", O_RDONLY, 0, EPERM);
+		skel->bss->require_ref = false;
+		ASSERT_EQ(skel->bss->calls, 2, "hook count");
+		ASSERT_EQ(skel->bss->rcu_calls, 1, "RCU hook count");
+	}
+out:
+	file_open_name__destroy(skel);
+	if (fd >= 0)
+		close(fd);
+	if (dfd >= 0) {
+		unlinkat(dfd, "alias", 0);
+		unlinkat(dfd, "new", 0);
+		unlinkat(dfd, "target", 0);
+		close(dfd);
+	}
+	rmdir(dir);
+}
diff --git a/tools/testing/selftests/bpf/progs/file_open_name.c b/tools/testing/selftests/bpf/progs/file_open_name.c
new file mode 100644
index 000000000000..ea09af8fc238
--- /dev/null
+++ b/tools/testing/selftests/bpf/progs/file_open_name.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "vmlinux.h"
+#include <errno.h>
+#include <bpf/bpf_helpers.h>
+#include <bpf/bpf_tracing.h>
+
+#define LOOKUP_RCU (1U << 8)
+
+__u64 pidns_dev;
+__u64 pidns_ino;
+__u32 monitored_tgid;
+bool check_enabled;
+bool deny;
+bool require_ref;
+int calls;
+int rcu_calls;
+__u64 base_ino;
+int observed_flags;
+__u16 observed_mode;
+char pathname[256];
+
+SEC("lsm/file_open_name")
+int BPF_PROG(check_name, const struct filename *name, const struct path *base,
+	     int flags, umode_t mode, unsigned int lookup_flags, int ret)
+{
+	struct bpf_pidns_info nsdata;
+
+	if (ret || !check_enabled)
+		return ret;
+	if (bpf_get_ns_current_pid_tgid(pidns_dev, pidns_ino, &nsdata, sizeof(nsdata)))
+		return ret;
+	if (nsdata.tgid != monitored_tgid)
+		return ret;
+
+	calls++;
+	if (lookup_flags & LOOKUP_RCU) {
+		rcu_calls++;
+		if (require_ref)
+			return -ECHILD;
+	}
+
+	bpf_probe_read_kernel_str(pathname, sizeof(pathname), name->name);
+	base_ino = base->dentry->d_inode->i_ino;
+	observed_flags = flags;
+	observed_mode = mode;
+	if (deny) {
+		int error = -EPERM;
+
+		/* Prevent GCC from replacing the branch with a negation. */
+		barrier_var(error);
+		return error;
+	}
+	return 0;
+}
+
+char LICENSE[] SEC("license") = "GPL";
-- 
2.56.0

