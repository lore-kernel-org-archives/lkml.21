Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795289696;
	b=SgCbXAzLH/k7A3m5kVd8cE5Yx0FHQrvvAL7mYqhxMnvo4ZWvp/VP/nHrmT5YbCD+cw6O
	 IL9Z+1YbmOTjQb3NWcirx7PhOmz3G4tRD7U+MM6HSx16xjn2qyEQ3nQ46iBBvkK6PoDWs
	 s2Rz/tuYs3HYMcJ5d1/ThOioAiWKu7N7CZ458aX+2yNBUNzI+fwOn9qrZ/uVz4mpNWwex
	 X2rx4oAdJ9FtrfeTQNe/6xWJYtLOSg7OrsJkLbMA6WuRMyxAJpL+3Fd8KMcqmk6jko0m0
	 sKIhaY0U5NhdyBaxxe/KUs0Mk/6D7Jmajm3xwo4Ss1HS/7hQ2cDmzRGMed12azqF5TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795289696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=n5ZnpCxALSpimlZbz+ysdwCQ7qxNjOgOx10w71IS4KQ=;
	b=5S7tH8KTbsfjSKbQDyKUsZznbvLnxWewqldpDIAo2XTVQE4henE1ikEIEFeWOsP91mSa
	 ph3HFWkROic/yntRFz6cupeb+oPsyUi1r9+PjyVH1LN6WCkKUn2Dw9IlL7T62i0YnVaZj
	 v/FNsULW5piLZzcIpu0RrdOhKt1rnRbcreZeVfvXFP4HJMobaJfObFfrEqjRU6LWYl3gp
	 BSoKQQi1hAowovGAFXNlnMhzBgvEX9paXcTQEhMgMu6H58qm70VDHb/SHw87n0wbB/CP3
	 f4viF5yMJ3ii9B+z7uMr8y0424xGrmx3c8W2qCnBFAUQs2bATNGfFIkrSr0N2kar5PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFfjWxj3;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D832606A32C
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 19:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D832606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFfjWxj3
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so14890595e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 11:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795289694; x=1795894494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n5ZnpCxALSpimlZbz+ysdwCQ7qxNjOgOx10w71IS4KQ=;
        b=jFfjWxj3Yvj4oNqD7D+livIIw1prdztnBFVWXeISH05y72ksTpXjmPM0Z05gSL+Mu8
         whT/jP3IRkvo8MpCsIqeIZzyDDG5A/ewg09CW1cZGaGa1sNKOK5nQ2VnHkkepxvv5d0z
         9QICjsYFNotjwblXS3EybXhYxR4ynCk92SdOVHZJbbmWYnp5knlfcJeDQKIplLVe3q5G
         9QPRamiXuXSYLbLio5MQTG3ADwDZzglS4+6TUWlwRx+3otCncuwMHiNS3izRx6uGWWpF
         kkqrbFZPfC48f5QvLGrQNKxisZjyUYKcMUk2/t4OlCcvjJ7dnrvJCrZTgLaTyMcYzJeI
         qdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795289694; x=1795894494;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n5ZnpCxALSpimlZbz+ysdwCQ7qxNjOgOx10w71IS4KQ=;
        b=K8Y53hXj8m4Ep2Uc+DpCJGM/AmLB656ta/0Ob1MJDfhHeDyzvCaNGdSG1UsM5Dn9jr
         4tp69cu40O8zR/Bg2eJXa/FRXH6SlL1wNURcImjju1xoNqOmwxbu2gDVNF96LwH7ngS/
         dF+7KjTqk66/4DCZRlqhN9Miv80hn+h/NHQdbstqFMnIebbSxuW25MlkfDz8cQZlVY/p
         HGrUIx19Rx6K7zxRTBWjkb+WfGlVfnA7JSSvl5q1MOF6/BXI0DOeiMVSX944LpZzkJg4
         3SwlrfauyKOR86goHAxa7SG2pujweq6gkXO7iTjZjAxlNPnsxK4uhrOInyHb0FdT3UQl
         ANOQ==
X-Forwarded-Encrypted: i=1; AL+hErHhYOyFw+GpHya5zY8cIk0rPvaY3vUJaZ0U87eD2p3X68eCQ8akqCJJQKoA3jp6DzwIwG4YCqpUu7bExpI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9voG3JYduQcUEYnYICXbQKKT3LegO/UxFU4r9HKxbHJQs0vEeJ
	xS0TnnDBurFSf27bWPZAF+gprM4kiLZZAILkiauzjATLLRARy2MC2du6
X-Gm-Gg: AZFdTZezox5OLh2bbHs0sSTpcvEWICULIjo+pUTjA5CRcNQRWaGPPpKhVemixFKOAA2
	8iqfqbewXGjobg8mDQOGa3/fdNkrtPiy0NMoScQc3A3LqDOi60+xBl3ZCgPnyrvKQy6h7zNAli9
	ZtI1SuPMpz5vcv/e5b4wvYKWGldJDcwbi1w0r4F1GKOtToPR+osWvNx4f1jpnyCNS/j9S4XTnQE
	PF92OL75mz2ABAYWmzxLN6PCXUX2jCEKXrvsbf3+Q6+TSmYO7ww0DWVxC74568423Jf7zPF4qkF
	Mgy0G6FT/mf8PQYqaoOOXtS54E/wymrggD7I57u/3W2fXsYJeRJzzVCw7XOTioWIr3Fne7DO3r1
	biHZFqmJzPqU8addFHnA8DvthLQHCYz6YyCuJy3ERKuJNaF7pnRG4vZQYixBvbK9CQ/hoOXhom2
	eVWPfmaS50PKIek/SAEzTXIK5ifDBnO97Ugqx7/kVV1a1YRq7x34+3a+qztHryJtdN007B+tNYp
	r5/sJk8rGYOw7DSMkrcXYyNvXIzwUCNeLz/fvnvxwjbLQEaJT/2AqYg6rTvBFeDuLBURmbwRs8k
	cTPbhh0+5C9MdGVJTz4NdtBAT1bEkmJv+J5j7PJ092vGXM1sEw==
X-Received: by 2002:a05:600c:4e0b:b0:4bb:6f45:2a79 with SMTP id 5b1f17b1804b1-4bb88817920mr169852215e9.22.1795289693852;
        Sat, 21 Nov 2026 11:34:53 -0800 (PST)
Received: from NullSecurityX.localdomain ([178.244.203.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm69591845e9.2.2026.11.21.11.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 11:34:53 -0800 (PST)
From: =?UTF-8?q?Ozan=20A=C4=9Fdepe=20=28NullSecurityX=29?= <agdepeozan@gmail.com>
To: brauner@kernel.org,
	viro@zeniv.linux.org.uk
Cc: jack@suse.cz,
	corbet@lwn.net,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ozan=20A=C4=9Fdepe=20=28NullSecurityX=29?= <agdepeozan@gmail.com>
Subject: [PATCH] Documentation: failfs: setns() back out needs no privileges
Date: Sat, 21 Nov 2026 22:34:46 +0300
Message-ID: <20261121193446.105396-1-agdepeozan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The "Leaving" section says the remaining way out of failfs is setns()
with a mount namespace file descriptor and that it requires
CAP_SYS_ADMIN over the target mount namespace as well as CAP_SYS_CHROOT
and CAP_SYS_ADMIN in the caller's user namespace. That reads as if an
unprivileged task in failfs that holds no namespace file descriptor
cannot get out.

It can. A pidfd names the namespaces of another task without a path
lookup. create_user_ns() refuses chrooted callers, but userns_install()
does not, and the caller owns every user namespace created by its
effective uid below its own. setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS)
on a task that runs in such a user namespace and in a mount namespace
owned by it passes validate_nsset(), userns_install() and
mntns_install(), and mntns_install() resets root and working directory
to the root of that mount namespace. Rootless containers, bubblewrap
and browser sandboxes all run such tasks.

Verified on v7.3 with an unprivileged caller: after
fchroot(FD_FAILFS_ROOT) open("/etc/passwd") and unshare(CLONE_NEWUSER)
fail as documented, and after setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS)
open("/etc/passwd") succeeds.

The section already says leaving is not a guaranteed interface and that
seccomp has to restrict setns() among others, so only describe the path
accurately.

The issue was found during an AI-assisted review of fs/ and
kernel/user_namespace.c. The reproducer, the documentation text and
this changelog were drafted with the assistant and reviewed and tested
by the submitter.

Fixes: a45a6605cd04 ("Documentation: add failfs documentation")
Signed-off-by: Ozan Ağdepe (NullSecurityX) <agdepeozan@gmail.com>
---
 Documentation/filesystems/failfs.rst | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/filesystems/failfs.rst b/Documentation/filesystems/failfs.rst
index 21ff2db79..c34e29403 100644
--- a/Documentation/filesystems/failfs.rst
+++ b/Documentation/filesystems/failfs.rst
@@ -65,9 +65,18 @@ implementation, not a guaranteed interface, and may be loosened later.
 For now a process that entered failfs counts as chrooted, so it cannot
 create user namespaces to regain ``CAP_SYS_CHROOT``, and ``chroot(2)``
 or ``fchroot(2)`` back out require ``CAP_SYS_CHROOT``. The remaining way
-out today is ``setns(2)`` with a mount namespace file descriptor, which
-requires ``CAP_SYS_ADMIN`` over the target mount namespace as well as
+out today is ``setns(2)`` into a mount namespace, which requires
+``CAP_SYS_ADMIN`` over the target mount namespace as well as
 ``CAP_SYS_CHROOT`` and ``CAP_SYS_ADMIN`` in the caller's user namespace
-and resets both root and working directory. A process that holds no such
-file descriptor and restricts ``*chdir()``/``*chroot()``/``setns()`` via
-seccomp cannot currently get back out.
+and resets both root and working directory.
+
+That way out does not need privileges or a namespace file descriptor. A
+pidfd names the namespaces of another task without a path lookup, and
+joining an existing user namespace is not refused for a chrooted task
+the way creating one is. An unprivileged caller can thus leave with
+``setns(pidfd, CLONE_NEWUSER | CLONE_NEWNS)`` on any task it may access
+in ``PTRACE_MODE_READ`` mode that runs in a user namespace owned by the
+caller's effective uid and in a mount namespace owned by that user
+namespace. A process that restricts
+``*chdir()``/``*chroot()``/``setns()`` via seccomp cannot currently get
+back out.
-- 
2.53.0

