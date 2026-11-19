Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084974;
	b=c0WwzMYd7K5FsUDCc5GQbR/tg7TJxo9nFU3Mm0TRZPYx0WKhy0w8iwOm84NDI3LP9Cvy
	 J5KPzIkTpj5M2RGsOz6rXRY5VlEas9oMS90GtqidQMw16zUWhVPWHxX9H+TlnlxoFdhdH
	 sg8KJte6JoGZiSa4Oof3KoyO8NeDJfuN0zBgnIl8hPSU45Td+Z1zs2tjMhLTpsSkNfuk0
	 NTpPRnBlVl7MQlMXIvXrmEjixn3NiAZqeaJ9PW1kuo9elZXPxNGo1Wvl0wYGIIElMJ4fD
	 hOjw9RP7oJ6ay55rghm4QabJ3OmDmKdWwWPuPIW4AFYwjNbSzcJ/G9w2zSCDVNd/bPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=u8ExomxaVoqynWwbL+tI4DQgA+MBylEC1NcrigkAqXU=;
	b=e36URiNAJKqu5nbxAdMMT/Si6nMginxNhuQqYztixi0lwOMHNyOMEettNAL3vjTBdTso
	 VOd3CQxjh0qVq4xn1lic1kYpdZYcAxi+eChbf2sf0cfHzmvllcpeTg6IAHSYMyEy10yye
	 cOgGgCrzTyIPZBeksDn6ojR/PJtulDJD0K0EWziNRgV4OvwCLeVXx/eWZTPNjW0/CS+LO
	 fXBAu/v7kDQl9o1pGdeaIdH6fhCwVG/D/wYJfZjCf1nvDSejBZ0/b7DXMsrHT4ACbRHRp
	 8AgfrqLZkIx568Jrb35bR89lwkQe2gv4xkr7dy1IZhMUhk+yADrqf3yI1qNxm6nQQTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--halg.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dRpOyqCS;
	arc=none smtp.remote-ip=209.85.208.71
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3241360A260E
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 10:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3241360A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--halg.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=dRpOyqCS
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b5654ad27fso1764706a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 02:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795084973; x=1795689773; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8ExomxaVoqynWwbL+tI4DQgA+MBylEC1NcrigkAqXU=;
        b=dRpOyqCSUSWTPKJ5FMfmD1uxS4cVZ9x50pGRiq5+1mqfSqLDQLsI9SKhFwGKxlv6Cm
         iZMlFCNmkFWgnArllT5nf5e/Dzw7i3l17A4wvG2Y994GFEu1tL/bVrRAcqjoNAt8ienm
         HHNl4aY82koHmEHoAPTmABAdIHF+E+Sn94fEzXi5R1QE7cJ5En/hRp/Ak9umPloOyZnL
         79/LdJXMV+dDshnQLosb0wToQ/Mft+9ep+kz6cA25h2SDCt2vQwY2FJkcpx9UQwUmDoq
         KVnSxD9BbZivtMMIdLXc/mxZgwFoKaqJsf9y+zQLGby+xG+nPqqw/aihv33bcRVSae1S
         r43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084973; x=1795689773;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8ExomxaVoqynWwbL+tI4DQgA+MBylEC1NcrigkAqXU=;
        b=LTNSjsXpx+RfOBvFfbwnVLxkX1DyyqgWkwGKw+3DcboHg6QidjWvO75/D/g+6xRX1S
         llLCg4VV54mkFm31jEQWRDwUJa4e8E1/Gf/nyIrCM/NSjgXmzW9sR8Ys0vt/PprbgqnU
         YE2SFxxsmrEGxftrrwszNowtQLcaWqCEuTIIoBxgt+J92rqe0YXus5R03j6EItWPRrp6
         id/ECr972qqQEkhm+2ctC8EpBUor+rCLVplfUmB8dVwA11lo044B3keFjFmO/Juor5d/
         ZZeDvYgciSFd1eervjIjJJ/yoCH4zlJyqulSIPSsIYyeTAanz1SwXkuvfrPfWmi1PitD
         hg4A==
X-Forwarded-Encrypted: i=1; AL+hErEtxeOfdMVX3UBsfKWWsfamy8rKibuEBa9eMGzJR/vnqMFveETrugpMngnSfNLkJY3PUFOffRsap1KCCkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FKDjowEIQvFE3vrMqryiwxkMnn5h+lZkxpswk1RcSWbHlLgms
	eA95Lv9P145P+K8ZvCV4erQ70EmY7xTlDhvMESeOZk9WIu1qhL/mwDVOWmM+gelsqlL80+UhHg=
	=
X-Received: from edqs14.prod.google.com ([2002:aa7:d78e:0:b0:6b5:76e4:de9f])
 (user=halg job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:321b:b0:6ba:1347:5bf
 with SMTP id 4fb4d7f45d1cf-6ba13470764mr1098394a12.35.1795084972449; Thu, 19
 Nov 2026 02:42:52 -0800 (PST)
Date: Thu, 19 Nov 2026 10:42:07 +0000
In-Reply-To: <20261119104208.782900-1-halg@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119104208.782900-1-halg@google.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261119104208.782900-4-halg@google.com>
Subject: [PATCH v2 3/4] proc: expose userns capability mask as CapUns in /proc/<pid>/status
From: "Hallgrimur H. Gunnarsson" <halg@google.com>
To: Christian Brauner <brauner@kernel.org>, Serge Hallyn <sergeh@kernel.org>, 
	Andy Lutomirski <luto@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, Kees Cook <kees@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Jonathan Calmels <jcalmels@3xx0.net>, Jann Horn <jannh@google.com>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, KP Singh <kpsingh@kernel.org>, 
	Casey Schaufler <casey@schaufler-ca.com>, linux-fsdevel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-api@vger.kernel.org, 
	containers@lists.linux.dev, keyrings@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Hallgrimur H. Gunnarsson" <halg@google.com>
Content-Type: text/plain; charset="UTF-8"

Render cred->cap_userns as CapUns in /proc/<pid>/status alongside other
capability masks, allowing userspace tools to inspect a task's userns
capability mask directly.

Document the new field in Documentation/filesystems/proc.rst.

Suggested-by: Christian Brauner <brauner@kernel.org>
Signed-off-by: Hallgrimur H. Gunnarsson <halg@google.com>
---
 Documentation/filesystems/proc.rst | 2 ++
 fs/proc/array.c                    | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index fa7a468e8edf..9cf45810e41c 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -200,6 +200,7 @@ read the file /proc/PID/status::
   CapEff: 0000000000000000
   CapBnd: ffffffffffffffff
   CapAmb: 0000000000000000
+  CapUns: ffffffffffffffff
   NoNewPrivs:     0
   Seccomp:        0
   Speculation_Store_Bypass:       thread vulnerable
@@ -286,6 +287,7 @@ It's slow but very precise.
  CapEff                      bitmap of effective capabilities
  CapBnd                      bitmap of capabilities bounding set
  CapAmb                      bitmap of ambient capabilities
+ CapUns                      bitmap of userns capabilities
  NoNewPrivs                  no_new_privs, like prctl(PR_GET_NO_NEW_PRIV, ...)
  Seccomp                     seccomp mode, like prctl(PR_GET_SECCOMP, ...)
  Speculation_Store_Bypass    speculative store bypass mitigation status
diff --git a/fs/proc/array.c b/fs/proc/array.c
index f6f75d206762..2b86673aae00 100644
--- a/fs/proc/array.c
+++ b/fs/proc/array.c
@@ -311,7 +311,7 @@ static inline void task_cap(struct seq_file *m, struct task_struct *p)
 {
 	const struct cred *cred;
 	kernel_cap_t cap_inheritable, cap_permitted, cap_effective,
-			cap_bset, cap_ambient;
+			cap_bset, cap_ambient, cap_userns;
 
 	rcu_read_lock();
 	cred = __task_cred(p);
@@ -320,6 +320,7 @@ static inline void task_cap(struct seq_file *m, struct task_struct *p)
 	cap_effective	= cred->cap_effective;
 	cap_bset	= cred->cap_bset;
 	cap_ambient	= cred->cap_ambient;
+	cap_userns	= cred->cap_userns;
 	rcu_read_unlock();
 
 	render_cap_t(m, "CapInh:\t", &cap_inheritable);
@@ -327,6 +328,7 @@ static inline void task_cap(struct seq_file *m, struct task_struct *p)
 	render_cap_t(m, "CapEff:\t", &cap_effective);
 	render_cap_t(m, "CapBnd:\t", &cap_bset);
 	render_cap_t(m, "CapAmb:\t", &cap_ambient);
+	render_cap_t(m, "CapUns:\t", &cap_userns);
 }
 
 static inline void task_seccomp(struct seq_file *m, struct task_struct *p)
-- 
2.56.1.708.g77570a6a1d-goog

