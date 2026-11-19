Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795120675;
	b=PDGO1k1VKe3CFxfYcOeQrVqPKRT52qx+ybe10qtIJTCGmmmn/MglitbpDXQIKtS1e9UT
	 PFL6smPVEjFP9lfcVE3whZLF2ADckH+zEQRVcyPC1BqmIBSBA2otMGGh9OXQErX2F2ZtZ
	 lAVlHt1WJsI5e73LVCaEy9ekWFLtPMu5OFDyjM/d5s55Uq/pjso151URrPs6VloNQPkH9
	 7Dis54/g/8S2KxsMmgTYirJgyLbVlWViEytr9UIfh7QeZMerxZdduQ5RMgfeCjUboA8Nl
	 d4UT+wA86xEhxgEr+ACbhdGKVL5CCVqyiCwdzxYxipOBcWAjoeMGVON8d7abS9gSLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795120675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kEr31tcU68rglk/Zx5XyW3VAn0sFu+PMGSjGQk9S0TY=;
	b=2eblVsRJPd8iQ+XHcx7A1njtY8IRVL7Y9ZzCQ/A7Ho63VKzvL1u3Y75cJ+Z5L4Pd3G3a
	 a3vM1GjTTDkVeWWSQDqe3qv7X+1TDfOrq31FTqnSC+A+BhmsawV5KyoNKueo7E4uvpkiL
	 k8ueDJDZZ2nuf5nE8KLy2nrAylDElye4wcgryqpK3Y65lQuQIW95/I9B1Z3AKQ/mqaClz
	 0v9SscobwZjBcJOkYZNxBlzIDB9SZIIumq2G8OFibKuz+nYdNsz/Gz8PIL2/pkU5v1Cvu
	 Qgbgoc2SsFL7/vk4sTKvlVlPKQisjG+F6kx/tHa/CMZX0tW8jTIlrYwy9almpZ23KPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xata.io;
	spf=pass smtp.mailfrom=xata.io;
	dkim=pass header.d=xata.io header.i=@xata.io header.a=rsa-sha256 header.s=google header.b="l/4cSUFN";
	arc=none smtp.remote-ip=209.85.222.181
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6980B6074319
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 20:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6980B6074319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=xata.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xata.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xata.io header.i=@xata.io header.a=rsa-sha256 header.s=google header.b=l/4cSUFN
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-949680e6d83so20783485a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 12:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=xata.io; s=google; t=1795120673; x=1795725473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kEr31tcU68rglk/Zx5XyW3VAn0sFu+PMGSjGQk9S0TY=;
        b=l/4cSUFNleEq/Pc4NWDQbAUeSb/CBsRE0rCF48q/L0L4dSrgAJ863g/EZ3eQd6PcBQ
         2izhajQsap0TKPh5306sdd09yrcodVc0q8uuiBRrgUUM5dZ/yDC3yMCZxfx2s8S++vyV
         JSL2LPxwe8MjwMXVIgECs3ZDhsGY0IY0bJlCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795120673; x=1795725473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kEr31tcU68rglk/Zx5XyW3VAn0sFu+PMGSjGQk9S0TY=;
        b=R7stFe+II8fXg+grUNJhKneHH6OdaBlaTbSlaQSvOwFwfKReksZ8De8Ao9rpw2XH3h
         n0b9XF3MJtGNDx8+eKxZad3j+5luRBaAGJTYaj1NIqoqlXlkuzOcOmTjZW57yp+6W6Hn
         e4O9P63j5g6AVCl/kF9qXReFlXgLkvTus0PTENaKRZAjPjz5PfechfP5Dnye9U/izg6n
         HKjlkVaoaUkjiBlSuEOxf724sGpvKGWDN5W4Jpq5XIksgqCrrDdaIA4er4w9ZelmlJ7M
         rooqofBh6AXQz32Hpm6qpFpz4zpNQPcL1nszfT8/bXw7te8Lc79wyIJ8bTW+KimZYFFG
         ysNg==
X-Forwarded-Encrypted: i=1; AL+hErGnVMkKk2aC3LVIdVBCyRib2ngQQktol70YhNAWkA3uatK4R2+efMd/4J4ewdMqdO/nS/Vz2DwtQ8ihwHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ofq6Rgt6wPrWU13imT9YEqACnBDQFHeDAlQ0PSPzOyrO2rVWv
	Yxz0vxb74wFu5YawMugZkCfFqxsOD+M+hVzsp0SGG6Z3zunXSxRbb6yDHTX4oba6Xig=
X-Gm-Gg: AYBFou27Odo1oNTnmZTbfwJcE9T2qE3HXopWGM22NrKIaUYBXw3NuGWyYHte1nrHRyB
	bx0178cgL066faJh4Lzo/YcM/tmgmM6vavsLjEGxQclGuw6owG4JMvgb9Bg8sQilbR9SHkaqRnv
	qvcgN2LPzkMmPAi2truKZ+TKm9oAryRAZ9yNXBcLowUz+ezE7O69RBdrKVlKfTImrwud2sWzN/a
	iVN2Bc4Kuc7nXVSbdsa2YL+tWYJbmNUl+1pJnjJ50DdMVysLaOPEOzUQ2TkI2O1F4fF2AO3N1tF
	J8Z5ODRQHlX6TNL9G4baI07QqodIuYCtK4K2KEkrKPE2jvT2GHxh8SJFoXs3Q/cinrG+3qLhhxG
	da2+xaFEwHnTmM0WYzdgdoLtm7Po1CRxiN38xSVvpAHCzRIR3PoVFHZqAnU33IWNwcTMjhl1KZW
	ouQLGDsqT0JndSP6zzf2ntMF9R6kOk8H4G+p9qMca+/G0cHfbC2Q7UTlMkOoQzvL6ldGIVA8fXS
	o976sTjHUwTsau3aC0h69yNUDa+pGzL4lVW8jT3Gp2Q4+PqinNZU8SmYn4IvG2i67OXjR9mdo4d
	G+rJuqfjcU9j8u6OwvNmqOtOzz78LtPsv66dPTZQ9g5+YQ3M2c2gx/CWGFCJHF/34i2hR5WedPL
	l3cwX6LOn3ptl1bLG4TaAChajWu4ESqzuvPvmHl7/hN76kP5mCj5FoWg=
X-Received: by 2002:a05:620a:4724:b0:949:5e26:e92d with SMTP id af79cd13be357-949ba99cc02mr151492585a.31.1795120673241;
        Thu, 19 Nov 2026 12:37:53 -0800 (PST)
Received: from mac-m4-dongle.data.va.local.crowbird.com (pool-173-66-54-232.washdc.fios.verizon.net. [173.66.54.232])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm41035685a.31.2026.11.19.12.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:37:52 -0800 (PST)
From: Andrew Kroh <andrew.kroh@xata.io>
To: John Johansen <john.johansen@canonical.com>,
	Georgia Garcia <georgia.garcia@canonical.com>
Cc: apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] apparmor: fix label replacement compiled out of __label_insert()
Date: Thu, 19 Nov 2026 15:36:50 -0500
Message-ID: <20261119203650.51147-1-andrew.kroh@xata.io>
X-Mailer: git-send-email 2.56.0
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

__label_insert() replaces an equal label in the labelset from inside
an assertion.

	AA_BUG(!__label_replace(this, label));

AA_BUG() evaluates its argument only if
CONFIG_SECURITY_APPARMOR_DEBUG_ASSERTS is set. That option depends on
CONFIG_SECURITY_APPARMOR_DEBUG, which is off by default. Without it,
the compiler discards the call to __label_replace(). The new label
does not go into the tree and does not get FLAG_IN_TREE. The caller,
__label_update(), then removes the old label from the tree.

The proxy of the old label points to the new label. A task that
holds the old label therefore moves to the new label after the first
profile replacement. The new label is not in the labelset, so
__labelset_update() cannot find it on later replacements. A task
with a compound (stacked) label keeps the profile versions from the
first replacement and ignores each later replacement until it execs.

Containers that set no_new_privs and change confinement with a stack
transition show the problem. To reproduce it, load two profiles.

  profile a { ... /usr/bin/bash Px -> a//&b, }
  profile b { ... }

Start a long-lived bash under a//&b. Replace b with a version that
denies a file, then with a version that allows the file again. The
task continues to get the deny. A task under a plain profile follows
every replacement.

Call __label_replace() outside the assertion and assert on its
result.

Fixes: f1bd904175e8 ("apparmor: add the base fns() for domain labels")
Cc: stable@vger.kernel.org
Signed-off-by: Andrew Kroh <andrew.kroh@xata.io>
---
Reproduced on Ubuntu 6.8.0-149-generic, 7.0.0-43-generic and on
apparmor-next (7.4-rc1) on arm64. These steps show the bug (as root):

  echo 'profile a { file, capability, } profile b { file, capability, }' > /tmp/allow
  echo 'profile a { file, capability, } profile b { file, capability, deny /etc/hostname r, }' > /tmp/deny
  apparmor_parser -r /tmp/allow   # load a and b
  aa-exec -p 'a//&b' -- bash      # shell confined by the stack a//&b
  read x < /etc/hostname          # allowed
  apparmor_parser -r /tmp/deny    # replace b: deny /etc/hostname
  read x < /etc/hostname          # denied
  apparmor_parser -r /tmp/allow   # replace b: allow it again
  read x < /etc/hostname          # still denied; allowed with this patch

The check must come from the long-lived task itself. A new exec
(e.g. cat) gets a freshly built label and is not affected.

No other AA_BUG() in security/apparmor has a side effect in its
argument.

 security/apparmor/label.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index fd67262330f9..0dc18743b04a 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -693,6 +693,8 @@ static struct aa_label *__label_insert(struct aa_labelset *ls,
 
 		parent = *new;
 		if (result == 0) {
+			bool replaced;
+
 			/* !__aa_get_label means queued for destruction,
 			 * so replace in place, however the label has
 			 * died before the replacement so do not share
@@ -703,7 +705,8 @@ static struct aa_label *__label_insert(struct aa_labelset *ls,
 					return this;
 			} else
 				__proxy_share(this, label);
-			AA_BUG(!__label_replace(this, label));
+			replaced = __label_replace(this, label);
+			AA_BUG(!replaced);
 			return aa_get_label(label);
 		} else if (result < 0)
 			new = &((*new)->rb_left);

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0

