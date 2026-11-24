Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795548132;
	b=q2iu3sev8iO3AyB46f39F8BkV/X4sPss8ceefHx7UKBcK+GNHFKeLNZ2nZyWKjE0u3Ty
	 m1blRMJG0VpFKyH3J9jPozIPy1oqtORiLJVs1pKQH0Idc262TenMcXQ/doO7UBQ3ZvOuZ
	 NysBIQpkCwRjBftuHaNT1cLJeq9Lu553q6z0h1THYyUEFdG8c9k8ThhtTBwVYt90+N/hg
	 vg9bxgpzcFseQ+1jc1tWT0ZB0rkr5EsXxGJ0guvHti/mR9oDHfBmN772GP/kt53BBt1td
	 CiLI0rrv0/JOEYBYFPymIkCwV3QZAnvnh0jHsq2o1LBpCPMc+p3RVlwWeGcoylHD1VA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795548132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LZPiVycm3WyyFUgujH3SAz4SOdP4xReN9+vLGtP0/iQ=;
	b=Z/Eat/AiV0P0vVpNQMrNMFwjpMzoEXE/PkIqdu/tGDv6hFT9+6wU4wTtfO+k7188kGYW
	 jY7VIYFAYVnUHEEu5F66vhVpd0TP6dNZYFkRP4jBIOoAAx2BUyMvkmswKQRP7Uxdc0qIB
	 /vQjHhEAKJq0TIn4JehMRkwZSaIVfQJzEKALaBiXZ0Asr+sC3N5GyMrac3M05JzIfDtac
	 oNJqS64HgxixX447Vn244Oy3gWPyhuB/BIMtdYvcnxdpis7dle1WmideUXMnXsBpWpUih
	 egwDSU/meImiU2doay/KmNEhdTZFhKJdpCEOMXzKAIky6oZj2LLalvh/qOGVXdW7IDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bh50RA56;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54ED6606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 19:22:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54ED6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bh50RA56
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2328715c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795548131; x=1796152931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZPiVycm3WyyFUgujH3SAz4SOdP4xReN9+vLGtP0/iQ=;
        b=Bh50RA56mPo+nTw0xcu6Jaylf7Itkvzq10WEajJrHOjNZTXiIhRGjKRa0xcz0MFUvz
         hETpIrnyYv1BDtMRHzBaWvui4mRJ+FMjiIak2T/IC2OrWVdD50/IfQVswBJM5mIw5OhN
         BXVGEkuDN4f4IIwVyQ28/xXpI+uA7989WqnBpeLOsNsHi3sKPkC/92jnB5dP9H318L3j
         pBX4OXwb/IZig+YtOeAHT5sRO+tmgNJYXiYneeZ/bhZC+W3bfXTZUddQPZVB06bkuFy+
         gawz2V6v6Gq5s5RUx0/cpHNLhoxGLcaM63mzPwdVL7Uogy9/7A4n3QKkOLUENbqfQlMo
         j1KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795548131; x=1796152931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZPiVycm3WyyFUgujH3SAz4SOdP4xReN9+vLGtP0/iQ=;
        b=mvSPhWHt+/F/zOkXxYz5gZOi2ONxIhjg7Hh5jcLbluUHYBWQsZjk8wurv3B5FMfHM4
         RujxGtJYMeq+UcS2WiUZqq0urMfvphAPFQxSsZvkPvf1I738Dnrnq35L5FEdDP9f2Lsb
         Xwa1tklXdf/ZpHkC7kbkOFHlud+ZxOsuJMQfI/V3jzqI4LFPgq3SNA2PlW2q2JTeSdig
         QehoaIUxok+rtvOkGnS21kMsrlbAI0GntpUdN2dgWL1UCkcx1oCQk82ZBBBsu2Ez1sgb
         USdHRVLhjS662KYCjjHjqmAVk3LlU6tKnvhg5QWOO8z2CT7Fiyyt8K2EXgVqAuDKn2Z/
         QNTQ==
X-Forwarded-Encrypted: i=1; AL+hErGF+pIHaj7J2IB5UfwE/9LkGNtnSWWZRVgPa1YCpIFF9qrQ+hgzZQPRL3+wo25t7rJkb/BhWYfwOu8SUQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dICX6Jz23WhLTirIy3WFCXfjrQsmDm6oNmMJP+PzS1QeHF+pf
	7EuyKiKHhkSl4Q8R0GSee7Z32zQqntzh+LbS9jrOqBIR1+1fIA4Q/omW
X-Gm-Gg: AZFdTZeZcY49hI0afSYysNceNX0FVWmrWTRsscsX0HUDe+ZHeKtyI4/OAYJra223cj9
	6SkDKu00edHG/1KRibnuCWW7ohupgGI65Zj6+LQfEKHI2PTs58+3bJzuCLFwCkemgyyyiQ0MjOB
	+QLFzQTYUc19ixyw3vmAwQxfXqiuP93NxPjySFHW3HGjw9KzTHbIvmDpcdC2sulJhU5kvIQwgWE
	6Pn+ys7y31K858nBFZoJMO7FtIGdzX0tIBtq7cCVgrg/vdeylzu3TLNcxmNjSZBEmAPf2BO2b2k
	CVFoH0zdNBPo09v8ucXbHgOaQ4V2ozdc7yuyh1zzx5ZmS4PfsqqdAZVMjPn0asztsKB53At5JJJ
	jnb/kPAAqMNDFyy7wm9tuMJWFM4PvV7YVT5hUhrfqM/sKYhC9HCU9IMiwGR+2Hi2XlQeL7livNN
	782D0z4F9ieKiU6GotiBrLulXMdYONM1Jt1oGbRpo9WJsnTLIACuNRbXk1AeZY3uBgzGCcKjky9
	0zfWs7QiD3VOhiY7Q8ibq6DZeD8bPk/e6g9PzWWT7xvorxd9p1b+gsh7pswesp6pqcFLV5Pr+7k
	IX1og+cPqbE82hSw4E4sK/NHNisZbNUZy/O8zk574A==
X-Received: by 2002:a05:701b:4346:b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b556900481mr15198374c88.15.1795548131144;
        Tue, 24 Nov 2026 11:22:11 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm43034793c88.7.2026.11.24.11.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:22:10 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Kees Cook <kees@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH] selftests/seccomp: set no_new_privs after unsharing a user namespace
Date: Tue, 24 Nov 2026 19:22:08 +0000
Message-ID: <20261124192208.1234120-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Installing a seccomp filter requires CAP_SYS_ADMIN in the caller's user
namespace unless no_new_privs is set.  Two user notification tests
create a user namespace and then install a filter with
SECCOMP_FILTER_FLAG_NEW_LISTENER without setting no_new_privs.
Creating a user namespace gives the caller a full capability set in the
new namespace, so the capability check succeeds on a stock kernel.  But
on a system where an LSM policy denies capabilities in unprivileged user
namespaces, the check fails and the tests report:

  user_notification_child_pid_ns: Expected listener (-1) >= 0 (0)
  user_notification_fault_recv: Expected listener (-1) >= 0 (0)

Set no_new_privs in both tests, as the other notification tests do.
Both tests exercise the notification path rather than the capability
check.  user_notification_child_pid_ns is the only test that covers
pid translation for a notification from a child pid namespace of the
listener's, and user_notification_fault_recv is the only test that
passes a NULL buffer to SECCOMP_IOCTL_NOTIF_RECV.

This gives up unprivileged coverage of the success path of the
CAP_SYS_ADMIN check in a non-initial user namespace, which these two
tests provided only incidentally.  mode_filter_without_nnp still covers
the check itself in the initial user namespace.

Verified on an arm64 guest running a 7.0 distribution kernel with
Ubuntu's apparmor_restrict_unprivileged_userns=1: seccomp_bpf goes from
pass:110 fail:17 skip:15 to pass:112 fail:15 skip:15 out of the same 142
tests.  The remaining failures occur with and without this patch: the
notification_restart variants that ask for
SECCOMP_FILTER_FLAG_RESTART_BEFORE_RECV, and
user_notification_addfd_opath, which need kernel features this 7.0
kernel does not have.  Not tested as root in the initial user
namespace, where the capability is present regardless of no_new_privs.

The code and changelog were written with Hermes Agent, an LLM
assistant; the author reviewed and tested the change.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 66bb53bad93b..584fdd1a4787 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -3711,6 +3711,7 @@ TEST(user_notification_child_pid_ns)
 {
 	pid_t pid;
 	int status, listener;
+	long ret;
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
@@ -3719,6 +3720,18 @@ TEST(user_notification_child_pid_ns)
 			SKIP(return, "kernel missing CLONE_NEWUSER support");
 	};
 
+	/*
+	 * Installing a filter requires CAP_SYS_ADMIN in the caller's user
+	 * namespace unless no_new_privs is set.  This task has that
+	 * capability in the user namespace created above, but an LSM
+	 * policy can still deny the check, so ask for no_new_privs first,
+	 * as the other notification tests do.
+	 */
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_notif_syscall(__NR_getppid,
 				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);
@@ -3829,6 +3842,7 @@ TEST(user_notification_fault_recv)
 {
 	pid_t pid;
 	int status, listener;
+	long ret;
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
 
@@ -3837,6 +3851,17 @@ TEST(user_notification_fault_recv)
 			SKIP(return, "kernel missing CLONE_NEWUSER support");
 	}
 
+	/*
+	 * As in user_notification_child_pid_ns, ask for no_new_privs
+	 * before installing the filter: the capability check can be
+	 * denied by an LSM policy even though the task holds
+	 * CAP_SYS_ADMIN in the user namespace created above.
+	 */
+	ret = prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0);
+	ASSERT_EQ(0, ret) {
+		TH_LOG("Kernel does not support PR_SET_NO_NEW_PRIVS!");
+	}
+
 	listener = user_notif_syscall(__NR_getppid,
 				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
 	ASSERT_GE(listener, 0);

base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

