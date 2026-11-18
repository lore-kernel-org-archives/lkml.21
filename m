Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=83.166.143.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013685;
	b=DerXkqENZRliQex4646jQO5Vh9aUErD6oij0hot1Ake+ZAecIHMJsSQm+7UarILukWIt
	 v3L9+VrfukD1qmHy/FGkjayXJSu7n5bfpL64fhARwjXjyunVpZlJL7dCOXfxclqjGPfWd
	 dbbm654GKgIgbRTiuIBOW6SqNgo5gO1x+RloRI53C1Bpy+02c5qcsv1VNGhF/PkgnWGwo
	 9l77prDTnx+dyn7itqVFA2p4W4BoFL0cug/+zLtZoZZiUEERZiNJs52e0cfk0LeKzKCKL
	 qrdrexcy9mpCuoLiHHG36owFDJOjtvEMqcQFLyy+z2TQvFi+vUptUjyvazA9qoyPXHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013685;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Infomaniak-Routing;
	bh=1KgLygsoydJnhHUwLFUyB2r9sha4fkJ/lYIIH1ct9ns=;
	b=V7AeHIiK2rV8LKtlxrmxbSgjemapzLE4ulwPnbj2Io7gK7RJnZW8R/jI6PiaFXD4uOHy
	 A05EFCKy7gKR3/HJcfMaGVguqjTgXUCaii1bsCkbujs1hx2pmmY8m2/r43OL4gVO5TmYm
	 9YrPXn9jy/SwaKROksQ31wwCVyS6T+fCVU8V1rGE3BYye6FO7JdU4jSyEJa6EtU2ihCkR
	 mKDtdzaSBXz50FKbOHz05uoaAAqE+6rkbjtRHU8DeNFI08ySQ6keYgeEQmUCd12MZXtwt
	 PTzCGlzA00ZIsLo4CO1tLM3FZ0PBimhJGRKiEPpyxrZHa1WIAWOpZyJqYcq0seRsHqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=digikod.net;
	spf=pass smtp.mailfrom=digikod.net;
	dkim=pass header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=k7yJ1sZI;
	arc=none smtp.remote-ip=83.166.143.173
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AB9606A33F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:54:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2AB9606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.a=rsa-sha256 header.s=20191114 header.b=k7yJ1sZI
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jV4Pn287tzV5;
	Wed, 18 Nov 2026 15:54:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1795013676;
	bh=1KgLygsoydJnhHUwLFUyB2r9sha4fkJ/lYIIH1ct9ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k7yJ1sZIBk6Qni/9dxoL1v6O2YCLRi5n4EYzlOdmineub78bze0/iXPIDlwz37i2e
	 de/s+qXEIwOeOdv30VZeT88Sb16DHUjOIQ5zUoiNni2jrz6RgyJmyFi04wJI7nRAm8
	 jDdKQDmvg6pvKFVDYVfPlG6nOMJeZ6JzeDqwj3eM=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4jV4Pl57xlzdBk;
	Wed, 18 Nov 2026 15:54:35 +0100 (CET)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <sergeh@kernel.org>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Ada Smith <adasmithgt@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	John Johansen <john.johansen@canonical.com>,
	KP Singh <kpsingh@kernel.org>,
	Matt Bobrowski <matt@bobrowski.net>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	selinux@vger.kernel.org,
	Serge Hallyn <serge@hallyn.com>
Subject: [PATCH v3 2/2] selftests/landlock: Test PR_SET_SECUREBITS mediation
Date: Wed, 18 Nov 2026 15:54:29 +0100
Message-ID: <20261118145431.2551578-3-mic@digikod.net>
In-Reply-To: <20261118145431.2551578-1-mic@digikod.net>
References: <20261118145431.2551578-1-mic@digikod.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Test that Landlock denies and logs a privileged PR_SET_SECUREBITS
change, now that the previous commit routes its CAP_SETPCAP check
through the capable hooks, and that an unprivileged change still
succeeds.  The domain deallocation record must then report exactly one
denial, which proves that the unprivileged change was not denied,
without relying on a no-record timeout.

The check-exec selftests already cover commoncap's securebits semantics.
Without the previous commit, this test fails.

Cc: Christian Brauner <brauner@kernel.org>
Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <serge@hallyn.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---

Changes since v2:
https://patch.msgid.link/20261117101738.2523492-3-mic@digikod.net
- Use ASSERT_EQ() before checking errno (suggested by Günther Noack).
- Shorten the commit message.
---
 tools/testing/selftests/landlock/cap_test.c | 69 +++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/tools/testing/selftests/landlock/cap_test.c b/tools/testing/selftests/landlock/cap_test.c
index 7c58ece1c6f0..35a419c46764 100644
--- a/tools/testing/selftests/landlock/cap_test.c
+++ b/tools/testing/selftests/landlock/cap_test.c
@@ -1071,6 +1071,75 @@ TEST_F(cap_audit, denied)
 	EXPECT_EQ(0, records.domain);
 }
 
+/*
+ * A privileged denial allocates the domain ID.  The following unprivileged-only
+ * change must not create a hidden Landlock denial, so the domain's deallocation
+ * record must report exactly one denial.
+ */
+TEST_F(cap_audit, securebits)
+{
+	const unsigned long unpriv = SECBIT_EXEC_RESTRICT_FILE |
+				     SECBIT_EXEC_RESTRICT_FILE_LOCKED;
+	__u64 *domain_id, deallocated_dom = 0;
+	unsigned long bits;
+	int err, ruleset_fd, status;
+	pid_t child;
+
+	domain_id = mmap(NULL, sizeof(*domain_id), PROT_READ | PROT_WRITE,
+			 MAP_SHARED | MAP_ANONYMOUS, -1, 0);
+	ASSERT_NE(MAP_FAILED, domain_id);
+	*domain_id = 0;
+
+	ruleset_fd = create_cap_ruleset();
+	ASSERT_LE(0, ruleset_fd);
+	/* Allow the child to replace the audit filter before exiting. */
+	ASSERT_EQ(0, add_cap_rule(ruleset_fd, CAP_AUDIT_CONTROL));
+
+	child = fork();
+	ASSERT_LE(0, child);
+	if (child == 0) {
+		enforce_ruleset(_metadata, ruleset_fd);
+		EXPECT_EQ(0, close(ruleset_fd));
+
+		set_cap(_metadata, CAP_SETPCAP);
+		bits = prctl(PR_GET_SECUREBITS);
+		ASSERT_EQ(-1, prctl(PR_SET_SECUREBITS,
+				    bits | SECBIT_NO_CAP_AMBIENT_RAISE));
+		EXPECT_EQ(EPERM, errno);
+
+		EXPECT_EQ(0, matches_log_cap(self->audit_fd, CAP_SETPCAP));
+		EXPECT_EQ(0, matches_log_domain_allocated(self->audit_fd,
+							  getpid(), domain_id));
+
+		EXPECT_EQ(0, prctl(PR_SET_SECUREBITS, bits | unpriv));
+		clear_cap(_metadata, CAP_SETPCAP);
+
+		/* Receive the asynchronous domain deallocation record. */
+		set_cap(_metadata, CAP_AUDIT_CONTROL);
+		EXPECT_EQ(0, audit_filter_drop(self->audit_fd, AUDIT_ADD_RULE));
+		EXPECT_EQ(0,
+			  audit_filter_exe(self->audit_fd, &self->audit_filter,
+					   AUDIT_DEL_RULE));
+		clear_cap(_metadata, CAP_AUDIT_CONTROL);
+
+		_exit(_metadata->exit_code);
+		return;
+	}
+
+	ASSERT_EQ(child, waitpid(child, &status, 0));
+	if (WIFSIGNALED(status) || !WIFEXITED(status) ||
+	    WEXITSTATUS(status) != EXIT_SUCCESS)
+		_metadata->exit_code = KSFT_FAIL;
+
+	EXPECT_NE(0, *domain_id);
+	err = matches_log_domain_deallocated(self->audit_fd, 1, *domain_id,
+					     &deallocated_dom);
+	EXPECT_EQ(0, err);
+	EXPECT_EQ(*domain_id, deallocated_dom);
+	EXPECT_EQ(0, munmap(domain_id, sizeof(*domain_id)));
+	EXPECT_EQ(0, close(ruleset_fd));
+}
+
 /*
  * Denials in the capset and mmap_addr paths are audited like capable hook
  * denials.  The vm_enough_memory hook only withholds the admin reserve, with
-- 
2.56.0

