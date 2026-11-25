Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608197;
	b=IAGA8PyEw/PL2KMwSMX2umf34lJpFlyXXGcpUS+1PcSvevZdfvDHbnif8c7hxwCDAhri
	 fkSH+qyGXOM/wkgCVljsI4rtll4JVLNp0Y7TjnJ8ZnvVcsKozkwpY8/Vb1Jp+fMTQ/Sh1
	 QRUjnUaG2CD0xwBiNM6ZCnD3s7BAadUuPbpkuuAfNYuQEQ8RaV3xDxsbC0LpTLezCYru0
	 /bTOikHk8RMLOLWVRrp5+rGUTyTZopNfGn23aFFBO57/HD9G5lnL1p+XrMCI1LQ2gG9ko
	 T167x18AKbcrNlIF9EqUKo7XE9ANFUtro2sSK49CV2Or65o7s1XxyQCo+rZ9EXFNV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=K7ERjWp9BStT3EDTOV7LHzOfw1KpQrzGoy0wGkEveS4=;
	b=UQ52jjREqg8A3oY949gDLgX/dSimydSEFhePDQAX8gCBl2XNpyeMzJMrrdx9U6Tj2Nqf
	 0RDlq1sb07U9GEiR4SYP+/nGVy0ISH5YTzkm/S3q2OKG6ZQgZzoHoCubH2jNOezZJ8t0W
	 r7BAOahqkJ5mfDlshlodTDLL2hQakl/IePwYgNafj6eiLzBu1UjcNi/qcl8lsw4B0mkEa
	 a8UpL2gcWn6tJJjmY61OcDoVNsC/I6z0nhvzVxqRdWVmFhcNDly9Ze90NSUlj5eL807U5
	 7quMM62bCtwlbGOSIuEbV2sKHpsu3rPBQZn8K35tg/qqO30DhoUnBfEfLdqm9bSixaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I674EsoW;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82418606A680
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 12:03:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82418606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I674EsoW
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb9d8e8e90so28330895e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 04:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795608196; x=1796212996; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7ERjWp9BStT3EDTOV7LHzOfw1KpQrzGoy0wGkEveS4=;
        b=I674EsoWMu/BiQYkqt/OKtddjAJXM6ehyE//Fo0v/dw5RX3sJWOGqXQPQWGAmhirtU
         TK0K9n26iDMwKdm8kwb+FAqJU/UpxcsLRAmJi8w0YB1IQ/ULhUfwyLgyhQtUEGf654IH
         MC6i55LEt/84SZIsk6euEVL5OlmlGCq+xyiEvnDYpe9IibGu6avpHOC0HY6Hti/fipqb
         LIQ64utw/4PGwkeuzeG62+3DOosC5bnG2i6MhmN2vMZ8IwVlFcDQQSHOxz7H3ZjXmIac
         tvfvdnW8hGsIi7aGbZc17BZiM+HDQGhzx+dgl7ujhP7r0dsFnmeLWk2rRqBW4y3YMPR8
         7CEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795608196; x=1796212996;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7ERjWp9BStT3EDTOV7LHzOfw1KpQrzGoy0wGkEveS4=;
        b=HNLn3mlNws4+Vh0ap0APWk6XlRpXG52bMS2jK/3aoq53TbEdTvFKc1MIE/UUr4/WNg
         6jpLpbv2W1H3KgaaWVS44O5nbyBG6RTU3NaW4C4jOUApf2E2F0dnQJlLd7tvnP0kgmp4
         TNn0vPw49DzuCifIKhnlmjwSmKqUvTfMDpQXCHxPZFQ1HZ9toUX6Jp2Ujzt9xy/VLzH3
         0a3q5Jv+BWRUsRWmdAD5Xpc8YSMi8PDf7cHsrL+kdBl7dlM6Dkdg4x/0HKt/syMe532h
         sqaRAH89lDxc2o5pfh0MyparNeqLFHFZGyTBN4wUmWqodtjE21N7PtFPOkpcB1QlkSMg
         LX2g==
X-Forwarded-Encrypted: i=1; AL+hErGoO2nEwH/4pmL4/3e5p9cDOmeF8kNC9h+TG6TWs++WU/JV9ITLvJQHnmjzy4zTAkgLVtXKPXbJGvL2MdI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KyKGcIxAqMIU0HZJ3r6mtlAUDyobEPHu1+pnHBb5RAcSlr/Gx
	f5UBOP/pYnHBCvsU9u/iWS8iD1yHblmm3qkdlBa1AgXo6s+F7V8vxlpE
X-Gm-Gg: AZFdTZfXfWksiI2Ho/9h3ShGEmR25TfnBgQy9Xs6xelY2JbWnofIEkHagpIYoAAxDmA
	lAfDj6a+Lx0pUxX11HNUyVyWY0alGRqgCWopj+YbJiqzpA/KpU1P2LuAvnAeXt/FWnFKKpzt+ra
	0njgjlDZMKYRZBuOhc5zfx0wva8weNT0NFWoaYEmcWpB+Z5MekkT+O2yjTsUTsffPmfZ+dizafI
	CLR5Rm+ZhkeVk6tc0hvo5386V8e4cue4MOQFtXFjHedzL3Hx/q2MoDmlSsOMIpDHVdRS07RJXVZ
	JIc5k4oQGvffRBYW/Hg+xlDjtsnyuAjEUnU74uKE2Zel9w41Cq6pJdHTSZ4lGGLtSpJxdNmCa1f
	34QacBPaLLaM/NI0fXIH0jt08zgZqZy+SNvtZQZCcliozaeF75I6mc3sbW9i+MsKQ9dbjobp2Du
	3g5Z06qK3wcEsiUIGivwmlQ23diHKQWyn7dXR61fHK5gAsTRvAb0crEG0GQtiMjq/T+1vvCCb1V
	joZs2W0IszL5Cam/AW2jOd/n42l5KqBtlv50FMU8bP5KARhtg48g5eFIZ3UWpRUHwcjBEIlNJzU
	WMZJ5sTx0TuHhVDjZy0LHtS/zPwqMibs6Zk+VNVrRKbg4Vc=
X-Received: by 2002:a05:600c:3555:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb8881da76mr354343525e9.34.1795608195555;
        Wed, 25 Nov 2026 04:03:15 -0800 (PST)
Received: from thinkpad ([92.36.121.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm417696455e9.0.2026.11.25.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:03:14 -0800 (PST)
From: Andrey Zakharov <dedemorow@gmail.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Zakharov <dedemorow@gmail.com>
Subject: [PATCH] selftests/x86: Add a test for ia32_emulation=
Date: Wed, 25 Nov 2026 15:02:26 +0300
Message-ID: <20261125120226.1120235-1-dedemorow@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Nothing in tools/testing/selftests mentions ia32_emulation=. Add a
64-bit test that tries INT $0x80 and execve() of a trivial 32-bit
helper. Both must work or both must be refused. If ia32_emulation= is
on the kernel command line, the result must also match it; without it
only the agreement is checked and the other two checks are skipped.

Tested: under QEMU TCG (x86_64 defconfig, next-20261113): with no
parameter 1 check passes and 2 are skipped, with ia32_emulation=0 and
ia32_emulation=1 all 3 pass. On a kernel where the early_param was
renamed so that ia32_emulation=0 is ignored, 2 of 3 fail. The test and
the helper build with the selftests Makefile.

Not tested: CONFIG_IA32_EMULATION=n,
CONFIG_IA32_EMULATION_DEFAULT_DISABLED, FRED, 32-bit kernels, running
through run_kselftest.sh.

Signed-off-by: Andrey Zakharov <dedemorow@gmail.com>
---
 tools/testing/selftests/x86/Makefile          |   6 +-
 .../selftests/x86/ia32_emulation_child.c      |  11 +
 .../selftests/x86/ia32_emulation_param.c      | 192 ++++++++++++++++++
 3 files changed, 207 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/x86/ia32_emulation_child.c
 create mode 100644 tools/testing/selftests/x86/ia32_emulation_param.c

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 7565d2cf6a3c..4bd7406df1b2 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -17,10 +17,12 @@ TARGETS_C_BOTHBITS := single_step_syscall sysret_ss_attrs syscall_nt test_mremap
 TARGETS_C_BOTHBITS += nx_stack
 TARGETS_C_32BIT_ONLY := entry_from_vm86 test_syscall_vdso unwind_vdso \
 			test_FCMOV test_FCOMI test_FISTTP \
-			vdso_restorer
+			vdso_restorer \
+			ia32_emulation_child
 TARGETS_C_64BIT_ONLY := fsgsbase sysret_rip syscall_numbering \
 			corrupt_xstate_header amx lam test_shadow_stack avx apx \
-			sigframe_fpu_portability
+			sigframe_fpu_portability \
+			ia32_emulation_param
 # Some selftests require 32bit support enabled also on 64bit systems
 TARGETS_C_32BIT_NEEDED := ldt_gdt ptrace_syscall
 
diff --git a/tools/testing/selftests/x86/ia32_emulation_child.c b/tools/testing/selftests/x86/ia32_emulation_child.c
new file mode 100644
index 000000000000..c4ff19a7aba8
--- /dev/null
+++ b/tools/testing/selftests/x86/ia32_emulation_child.c
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ia32_emulation_child.c - 32-bit helper for ia32_emulation_param
+ *
+ * Does nothing, successfully. ia32_emulation_param execs it to see if
+ * the kernel accepts 32-bit executables.
+ */
+int main(void)
+{
+	return 0;
+}
diff --git a/tools/testing/selftests/x86/ia32_emulation_param.c b/tools/testing/selftests/x86/ia32_emulation_param.c
new file mode 100644
index 000000000000..6c7b7ecb1bd1
--- /dev/null
+++ b/tools/testing/selftests/x86/ia32_emulation_param.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ia32_emulation_param.c - Test the ia32_emulation= boot parameter
+ *
+ * Probes INT $0x80 and execve() of a 32-bit executable. They must
+ * either both work or both be refused, and this must match
+ * ia32_emulation= on the kernel command line, if it is there.
+ *
+ * Usage: ia32_emulation_param [32-bit helper that exits with 0]
+ */
+#define _GNU_SOURCE
+#include <errno.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <stdbool.h>
+#include <stdio.h>
+#include <string.h>
+#include <unistd.h>
+#include <sys/wait.h>
+
+#include "kselftest.h"
+
+#define PARAM "ia32_emulation="
+#define IA32_NR_GETPID 20
+#define CHILD32_EXIT 0
+/* If execve() fails, the child exits with EXEC_FAILED + errno. */
+#define EXEC_FAILED 100
+
+static sigjmp_buf jmpbuf;
+
+static void catch_sig(int sig)
+{
+	siglongjmp(jmpbuf, sig);
+}
+
+static void set_handler(int sig, void (*handler)(int))
+{
+	struct sigaction sa;
+
+	memset(&sa, 0, sizeof(sa));
+	sa.sa_handler = handler;
+	sigemptyset(&sa.sa_mask);
+	if (sigaction(sig, &sa, NULL))
+		ksft_exit_fail_msg("sigaction: %s\n", strerror(errno));
+}
+
+/* Value of the last ia32_emulation= on the command line, or -1. */
+static int param_value(void)
+{
+	char buf[4096], *p, *last = NULL;
+	FILE *f = fopen("/proc/cmdline", "r");
+
+	if (!f)
+		ksft_exit_fail_msg("open /proc/cmdline: %s\n", strerror(errno));
+	if (!fgets(buf, sizeof(buf), f))
+		buf[0] = '\0';
+	fclose(f);
+
+	for (p = strstr(buf, PARAM); p; p = strstr(p + 1, PARAM))
+		if (p == buf || p[-1] == ' ')
+			last = p + strlen(PARAM);
+	if (!last)
+		return -1;
+
+	switch (last[0]) {
+	case 'y':
+	case 'Y':
+	case 't':
+	case 'T':
+	case '1':
+		return 1;
+	case 'n':
+	case 'N':
+	case 'f':
+	case 'F':
+	case '0':
+		return 0;
+	case 'o':
+	case 'O':
+		return last[1] == 'n' || last[1] == 'N';
+	}
+	return -1;
+}
+
+/* Result of getpid() via INT $0x80, or -1 with *sig set if a signal came. */
+static long try_int80(int *sig)
+{
+	long ret = -1;
+
+	*sig = 0;
+	set_handler(SIGSEGV, catch_sig);
+	set_handler(SIGBUS, catch_sig);
+	switch (sigsetjmp(jmpbuf, 1)) {
+	case 0:
+		asm volatile("int $0x80"
+			: "=a" (ret)
+			: "a" (IA32_NR_GETPID)
+			: "memory", "r8", "r9", "r10", "r11");
+		break;
+	case SIGSEGV:
+		*sig = SIGSEGV;
+		ret = -1;
+		break;
+	default:
+		*sig = SIGBUS;
+		ret = -1;
+		break;
+	}
+	set_handler(SIGSEGV, SIG_DFL);
+	set_handler(SIGBUS, SIG_DFL);
+	return ret;
+}
+
+/* Exit status of the child, or -1 if it did not exit normally. */
+static int try_exec32(const char *path)
+{
+	int status;
+	pid_t pid = fork();
+
+	if (pid < 0)
+		ksft_exit_fail_msg("fork: %s\n", strerror(errno));
+	if (pid == 0) {
+		execl(path, path, (char *)NULL);
+		_exit(EXEC_FAILED + errno);
+	}
+	if (waitpid(pid, &status, 0) != pid || !WIFEXITED(status))
+		return -1;
+	return WEXITSTATUS(status);
+}
+
+static void check(int expect, bool works, const char *name)
+{
+	if (expect < 0)
+		ksft_test_result_skip("%s: no %s on the command line\n", name, PARAM);
+	else if (works == !!expect)
+		ksft_test_result_pass("%s\n", name);
+	else
+		ksft_test_result_fail("%s\n", name);
+}
+
+int main(int argc, char **argv)
+{
+	const char *child32 = argc > 1 ? argv[1] : "./ia32_emulation_child_32";
+	bool int80_ok, exec_ok = false, have_child;
+	int expect, rex, sig;
+	long r80;
+
+	ksft_print_header();
+	ksft_set_plan(3);
+
+	expect = param_value();
+	if (expect < 0)
+		ksft_print_msg("no %s on the command line\n", PARAM);
+	else
+		ksft_print_msg("%s%d\n", PARAM, expect);
+
+	r80 = try_int80(&sig);
+	int80_ok = !sig && (int)r80 == getpid();
+	if (sig)
+		ksft_print_msg("INT $0x80 killed by signal %d\n", sig);
+	else
+		ksft_print_msg("INT $0x80 returned %ld, pid is %d\n", r80, getpid());
+
+	have_child = access(child32, X_OK) == 0;
+	if (!have_child) {
+		ksft_print_msg("%s not found, skipping the execve() checks\n", child32);
+	} else {
+		rex = try_exec32(child32);
+		exec_ok = rex == CHILD32_EXIT;
+		if (rex >= EXEC_FAILED)
+			ksft_print_msg("execve(%s) failed: %s\n", child32,
+				       strerror(rex - EXEC_FAILED));
+		else if (rex < 0)
+			ksft_print_msg("child did not exit normally\n");
+		else
+			ksft_print_msg("%s exited with %d\n", child32, rex);
+	}
+
+	check(expect, int80_ok, "INT $0x80 works");
+	if (!have_child) {
+		ksft_test_result_skip("execve() of a 32-bit binary works: no 32-bit helper\n");
+		ksft_test_result_skip("INT $0x80 and execve() agree: no 32-bit helper\n");
+		ksft_finished();
+	}
+	check(expect, exec_ok, "execve() of a 32-bit binary works");
+	if (int80_ok == exec_ok)
+		ksft_test_result_pass("INT $0x80 and execve() agree\n");
+	else
+		ksft_test_result_fail("INT $0x80 and execve() agree\n");
+
+	ksft_finished();
+}
-- 
2.56.1

