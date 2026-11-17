Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958745;
	b=sS6UXc7VjYVRUufpY9gDLW4ft1JPWOELxJxuQ6lfCT3/w8XvP7OEM3famUpefpZo/Mye
	 20Nk4/cP+21CIf7q2a+RupXJ8hQaIk9wMVbJgMFhJ2nXCZZsyIehObb7hS2WFy3hTCGrc
	 uGK8cGyOU0AJm4rK6VcrrBz7CLLJDSW49gwptJByMUPFxNEi8gR6NPSs2NDG+uvgdoyrG
	 zNuOhQ4sVSupTgtHcZUG2PcWEZTunYzDEnGybKicxhnGQxVbodMN8QgqnqBA+XMMGQXrO
	 d6QMzgG+MiFL7ksMVAu11vHrPLRHicx5/4UEMQtS1CyNNyigh7N5QrAdVVqZl1dYfwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=13rJ6qcrw0C+RVUGD6P0swGO3LEvWo1pHbPZ4Y4exz8=;
	b=5nBb7amL3VoMoZ8mYx2SMBV3+VY5E7XCJDB+JuAy7vV9RzkNHixaI+0TQSqC2DryCS++
	 /BTdJYQHppyA9MMN8FH5iu6sDydHbBPtV3qqj51AF/QL5zrc5uim0yRmqHs0poHylHYlJ
	 dCjii0htMJSc5bvs5g43ChlpId8Adn/4znIQ6TmQhzNp98KnJioKsNNAG5CG/Rn0WEblf
	 5TLDeQPvu1YJkNMA8SYcxfgA96Hd1GgyDkt0GOKQFMDShUtBciIuan6NYyCGKDA3pAixu
	 3cGzRrDsejxU3/INnQLfsvQDkJiBdIlpZhC8uyU+Z6iEeP5hBzs5fPtMTL6WvYpm8Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMNSOLwp;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38771606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38771606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--cmllamas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JMNSOLwp
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so547005eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958744; x=1795563544; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=13rJ6qcrw0C+RVUGD6P0swGO3LEvWo1pHbPZ4Y4exz8=;
        b=JMNSOLwpwVPcqvk4AqGGxHoPyDbAzA95QH4DGL4r6iXLrbGoTNoTOai3VAvbEoznFF
         gB1l2Qck+SEXBGkmcStMzta6SEs7Od6ZImCs9GoAVPWsSA2ho6P1SgTjx5hhxrhtRtju
         OZ1WGbP/NV4FW1h3+YxQcgHMNksJVaoNiivk22EtZ0PwpXAFxX0VHzPML9jq1AbGrYAu
         IjLSS7W+loAKuYijjk+VZBD1EngHrQa6AQjG4yCIcPN9VouYBi+dRjviumyjdsfGTtTB
         PXeADQXEIBWVWDqa1RZFKOkoxIgHIwzxJ+5bfa39UXbAMe6yTyYOOifdH8UUsW962xM7
         yS2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958744; x=1795563544;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=13rJ6qcrw0C+RVUGD6P0swGO3LEvWo1pHbPZ4Y4exz8=;
        b=mndYHNAsCQxNRYyimXKrdClREmvukuWzatNVi0HCMtHPGf5vsi806uk70x9a4MqdZK
         tt4X3h7yL8qk55pxBNIqi0uP5OMpxEC93Hb142SfY+2AjMq1h/uEJuVmmBmlr4laEi2S
         JjyHq+jI2jJ3JdhehXuP6n54eL5sJjjfTTjagFnPyNNxK34amXJUwavihjMRG5HsMdCI
         a/Am0yupxR8YooIk1NItOBV4QEz6R3Kv960bw3kUveVNfIzfCe2YccY/F2+X94IkUH7l
         z84BbAHfJFLx+g+Sd4GwpfEwwqqdSwQV4tSV0cscZozpaXAeQAso6WYVChg3e5Zdskm1
         YWkA==
X-Forwarded-Encrypted: i=1; AL+hErHbEh7ZneRJSjhp3S5zVHdFsKYDiVnHYOhF1gSX1H8Zi7rASGxZ2QuDQF0ss1g53KiEiv8qAr0Od6Rly+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z94HspEBqQ3zNiBjMZHqoj7BMF8a8z0d6KlQaqpQxeq1SGEpXFh
	205ddZTJbik+qwafKVKVr3mc2XomfnZb5O4zPQV04uWDMP+P5PV/Hd76gvL1kC12Gy9mYsJQMQ1
	Mff7BjnMOUlkO7w==
X-Received: from dyblf35.prod.google.com ([2002:a05:7301:a23:b0:381:d719:7923])
 (user=cmllamas job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:420b:b0:381:ad6f:75e3 with SMTP id 5a478bee46e88-38280269c9dmr923584eec.6.1794958743665;
 Tue, 17 Nov 2026 15:39:03 -0800 (PST)
Date: Tue, 17 Nov 2026 23:39:00 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.703.gf848ed807c-goog
Message-ID: <20261117233901.2212899-1-cmllamas@google.com>
Subject: [PATCH] MAINTAINERS: add rust-for-linux list to binder
From: Carlos Llamas <cmllamas@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Content-Type: text/plain; charset="UTF-8"

Now that the legacy C binder driver has been dropped in commit
fd2bc059ed46 ("binder: rm -f binder.c"), drivers/android/ consists
of only the rust binder so add rust-for-linux@vger.kernel.org to the
ANDROID DRIVERS entry.

Signed-off-by: Carlos Llamas <cmllamas@google.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d738990161bd..64cd892b2516 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2062,6 +2062,7 @@ M:	Christian Brauner <christian@brauner.io>
 M:	Carlos Llamas <cmllamas@google.com>
 M:	Alice Ryhl <aliceryhl@google.com>
 L:	linux-kernel@vger.kernel.org
+L:	rust-for-linux@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
 F:	Documentation/netlink/specs/binder.yaml
-- 
2.56.1.703.gf848ed807c-goog

