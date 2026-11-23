Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434296;
	b=BcbKeuwwJQIFGqMZHCSp2GEejufRlxn6bh30OeXUJczqmIhhmJM3eEwpfFjNRvsZkQ7G
	 O3WJZGqCbgSAQMAj7qmSOJRhI9JQAW2e+stNHjociBpjRNtzySOFN6IXDHrVFqK8ohG2q
	 ceO9rkM+N6TyAVGB19Ghckvbx91mhDmzr07+iC8+xjvcamYv2uEMOHY2LjNUbON7uBBK6
	 A2H7zm1Sq4PCBdz7kYVASalMxjW51JCOrXwda1nG0RXr0AWhrmtyCbTtJ9S3QATyLRHNg
	 oBtVaymC09R6fr0shWEpV87RROZabeTjdlJUbqAEgZGJ1Yu6hj3gKlScL0It3n7x3Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wao1lDLNbUFd8H98o11hNOXj6BtvvuLII7zQ8aDHCoA=;
	b=MG4wGjZeEUGppyXLAk94GvI35lNKcO0QMeZrqYJbiKkbrvjg+XLShMgNFTBI+pSNoV/s
	 o7MMUYpI0UFL9oxBMnrYRMACkve97eznzz6d6le7IbHN17ecU23zEg5VZjNBG9dlQ5n2H
	 y6L+NYZpPujeC2nifW9JQ1x4AojFnZFmLcOri1UZR+avl/+zJhyw3l5/InKXRlBpmjADJ
	 ZEZCtHSRU86Ehv8vzXGiJaokOMmeYDW3Ud6TosQgH5h+ZaXaAzgvKgyodMDLRUJS7uBWN
	 UkshKJYT0ZWJJJAeMZqtx7Kzqfy/4KvuDkevmi2UU138skFacbh9ZvmfEsBAQqaXEkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="uX/T6Jvp";
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B35606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 11:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B35606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uX/T6Jvp
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-380b40312e2so7721976eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 03:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1795434294; x=1796039094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wao1lDLNbUFd8H98o11hNOXj6BtvvuLII7zQ8aDHCoA=;
        b=uX/T6Jvpgqm1tJlOq8nd1n3yBngZOJJsWljAE8ngjJ67WjO4XcppJpZfI9LcuZjO77
         QMzuIZtP23iIDtYgHN4p9h1zhO1JKDoGN4t6lsyrSG9EDI3t8GTLyjWGhV1PTfVHB+54
         CUxMOF/uoHWZ6c+JuONYE2YtLDmoxCSwGiCsTZq8ENXKvGGBaYamhtETB4BBmyA2qkRz
         p6drrH4nAoZe+ndXq4r9t4H7kpC7P/4t4v7uWGf66RqWNJtsK7aEDadnMhewlwC3KNS5
         YPnUzwofxCDqc3rgq7ybcAhFbhK0oF16fThefr54y7ipHGq+t3sdDMOYzVAaj3L2BDlS
         hzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434294; x=1796039094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wao1lDLNbUFd8H98o11hNOXj6BtvvuLII7zQ8aDHCoA=;
        b=Cra9W1jOw7ERse2HJTcjpFA8zJxpO2cLnXBj8C2oOzSxlyJaMKAmntb8+xDUAGydCx
         aEXJaceS1u6IAbEkeKT2sypk3sx0VMkJUGqLymCe8po/aNanXniOU337gNx3NWmq5wPz
         +guiby3bWKLMjEJJvFOYt5QezQZ3m3pwqHq9K6sXR4cJR+uv09q3bvjEMoI3y1ds3+eU
         6VjOY91UF7TT1yB9jJiK5pJJu3wQhDAofK4ZHHY//if1WdcCBXtTsms/eUc1QcCJxxsp
         7K5mAJsE1ihBYgWatHx/oH9VkByvJd/Qji9u7f7e9Ld6ISeYDETg8rRghPAE89GLJ57g
         Wi5g==
X-Forwarded-Encrypted: i=1; AL+hErE3VG34Um45ER+S30vCb5cfNf/X7f/hiPsB9EQUGdh6u+qVb5HwJVkSsAsCCpzJus3Kxf+Ghh07ci7Js90=@vger.kernel.org
X-Gm-Message-State: APuU4Z/CphItr6WhCwSkgd+FjeO0xY2vi8E5V3wBy+cY+YelPb80eIqx
	bXneUKG2YPHJnmGetPbApFfFcfviklM1e7DaMGUv8GX0cuOKC6khRjB5RPkKwF95Ug8p
X-Gm-Gg: AZFdTZfa1hT3KxuTzCpOZlObzpZllo5YtRTjHy6eBhBFt6+sDE0fsF4LYBs8viNY1pf
	vsJ4XDrDfENKBbGjHWVNvy6W1SHV59Rz2tn22YiCx3JshJ644FCwkQq9bwWU/VmhGod1757rPVG
	uJTixCQ7BTV+JuR/SW+HVA/vHweYDf6NobLsf+eTTqXsiicQ06eRSMqNt8K1KhJ1NxSxkt56RS2
	7M8sPq89BW6d0hi97GPiWpxcB2GrVL6TbqcrN0HRD9wKqEktKNC48BQZ3Mq7HccEgivedO0ilcg
	3TSRwW7z1MUkamSvWNSnoSqJoOIILW5HxDAvyqJ3m9HV4NoGbW5QXQAhGwkRV68HBAyN42mmv7i
	MbpZDi/I3d4pcn2pKKdLy4Bf51qGDKvdYl6iSepfYLy+pGq88UQnvPmY5iXMvEDBIEk/vzmmT3i
	+2+sgIy7O+AO8GU/0mVi4RwZ9OL+o59cWRTT1bZuPD1rJ2TnuVNL2P/gWcPNFLK0Iah5kCaHeL+
	KuGZaK38V5kNHRrgD+gwId5XjUIukRgQZT4cWBE37Wsd5uclJA8y5wiHOXCg/hYEDWspvDEgdfv
	yO6nQOkBp2cdhIEA1yR40HgZjFxBqTK++A2kdpdLaWr2r29tmsapBL8mZLlZ8z/qZc7dGQyuGX9
	kF/swjAZdzFCwiVZylaZdrBSVyjgnidhQblHS9ZA8tfdOMOt/qWcVng==
X-Received: by 2002:a05:7300:f797:b0:386:95e7:848c with SMTP id 5a478bee46e88-38695e79009mr9525592eec.7.1795434294209;
        Mon, 23 Nov 2026 03:44:54 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:14e:94e0:654e:d7ff:13d2:447d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm41943583eec.10.2026.11.23.03.44.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:44:53 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org
Cc: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Segall <bsegall@google.com>,
	David Hildenbrand <david@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Morris <jmorris@namei.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [RFC PATCH v4 5/6] kernel: add KAP checks for unshare and setns
Date: Mon, 23 Nov 2026 17:13:07 +0530
Message-ID: <20261123114308.8103-6-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123114308.8103-1-harisudhan@armoriq.io>
References: <20261123114308.8103-1-harisudhan@armoriq.io>
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

Check unshare and setns against the bound task's authority. Neither
has an LSM hook, so they call KAP directly. Every namespace type is
checked, and setns checks the type of the namespace it is given.

Unbound tasks are not checked.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 kernel/fork.c    | 4 ++++
 kernel/nsproxy.c | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/kernel/fork.c b/kernel/fork.c
index eb198c8df..4216a2de3 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -52,6 +52,7 @@
 #include <linux/cpu.h>
 #include <linux/cgroup.h>
 #include <linux/security.h>
+#include <linux/kap.h>
 #include <linux/hugetlb.h>
 #include <linux/seccomp.h>
 #include <linux/swap.h>
@@ -3276,6 +3277,9 @@ int ksys_unshare(unsigned long unshare_flags)
 			 current->fs != current->real_fs);
 
 	err = check_unshare_flags(unshare_flags);
+	if (err)
+		goto bad_unshare_out;
+	err = kap_check_namespace_flags(unshare_flags, "unshare");
 	if (err)
 		goto bad_unshare_out;
 	/*
diff --git a/kernel/nsproxy.c b/kernel/nsproxy.c
index 3fb1595a4..d41d7f5e9 100644
--- a/kernel/nsproxy.c
+++ b/kernel/nsproxy.c
@@ -25,6 +25,7 @@
 #include <linux/proc_ns.h>
 #include <linux/file.h>
 #include <linux/syscalls.h>
+#include <linux/kap.h>
 #include <linux/cgroup.h>
 #include <linux/perf_event.h>
 #include <linux/nstree.h>
@@ -589,6 +590,10 @@ SYSCALL_DEFINE2(setns, int, fd, int, flags)
 	if (err)
 		goto out;
 
+	err = kap_check_namespace_flags(flags, "setns");
+	if (err)
+		goto out;
+
 	err = prepare_nsset(flags, &nsset);
 	if (err)
 		goto out;
-- 
2.43.0

