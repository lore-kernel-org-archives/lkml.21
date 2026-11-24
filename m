Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795491243;
	b=eYaVR8ybSOTf0vFpAD6lsYVrH9g9D1Vqho2uAsCCAPP8NvEcPzEy5EjdfmGTcDhPH2i3
	 EMFfviCRNGnMnvVtSznF7ezteZxaVJtoaDpifGLOigqQl3Nr6ndUcbEoxu88E94GR/FnA
	 w0NOTX+cbZ2vTTuxfCZ7pG2iqUB9ty07EadRIJdDA64IWuANPhieI8qVgdXCIW8XqqG/4
	 QRIB0cGm0M67xbIxiF/3wNhK4L6q8/arwyW0I8j/GyzGrLAZoUcKXpJ6cjiMJBh2r3MU6
	 12zdEiuuczrwIUMShNgF+yTuNw1aJEfhAJaf8HFb3ZUxd9tAHHf7Y0KU0b+Ov3I2fRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795491243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=fgziihkmWmv71dbB/QFn4V+nTlNArdPHdIiY2QssMfY=;
	b=eF3D9xuc3F3En3Iyu2OtUzhJlF0wekmq9vvZatb4ClAXgjAQ2UU1EOp6aaObsksVHdEJ
	 Y7dniiBX2UKSf33HiBv+9tliRB1mZ1ZIviLtrUiVo8Oide//lq4jQXCjxTDkqJ3qkXu/t
	 5pu1+2a4TDLnNJB4rziYeRLVXjxmE1eNiikaVFolCPLj0O202LW9VLpDyeVqydWP2XEUO
	 ZGaVLQUUuOrSN5qKUTwhMYPsH5OoaXlxYx/vMVk51KgcAuBHEcP/U3haGBbz/bMqSxRv7
	 ZhpDRYDcJ5pLAn/5vT+BrW9Cre29UMhqxnkMr+lTjVjpnqOHKz0EGpaT/+CX1TEcAQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WxN8COg0;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B025606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B025606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nilayvaish.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WxN8COg0
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386a65fca25so2718587eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 19:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795491241; x=1796096041; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fgziihkmWmv71dbB/QFn4V+nTlNArdPHdIiY2QssMfY=;
        b=WxN8COg0PefxhVQqeUlaJ3/KFXORBGCTADpKl+7eGLSYwwBF3nsSfeEDJH/s6FkHZl
         vgAYMAD87gqDnY20PDcVdPC27Y75VX70ayC0f9rXqnb2jtUwZS+YFXVhQR6WufRNOjpi
         DXcFso2vdFi87Yc2gjL+tE3x1c7o8b1vIkI1xoM8gmdFMoSMFViOzcKKPzpVd5My8qYW
         HmLPYr7InIvT/6zJuMRtzxH3VrApc4hphFuBjdWOteOkTY9YpBkt+9nCG1PliCaOQv4t
         ZY6YfK+MCGh9ku0b5/055oY3mq/pR3UzXaO0OOK/IgzLaMZCwfMoM/jFVS1HLqRCUREu
         eJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795491241; x=1796096041;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgziihkmWmv71dbB/QFn4V+nTlNArdPHdIiY2QssMfY=;
        b=e0UA4/GazvUvOIrCdTJVLM1BTj/D9W86r0OJfYVCxfPjbv+x2EaXZtPRkWVEMuKQvD
         lh0Vh17rMybJqeESVjbWkfTseL5vQTyDnlTJUYhfuQgT5f2ygk44B2g7vt0l7c7QSbbk
         o7lPDdfGI+MYlwZzAzqR+tdjKTro9uj19kHKZc6CtibKKJ1sGFYY5E8sPEMrfXXzcIgB
         YETY1P68ZhDYy5peQbXtFajZjeaFvjs03lp0vT+B7Esv+5EABtS74pHhhVPJ3AdoVDOz
         Ojw4brwKTxQ4AX92azVgHt8UWabTOeU5T1z5ioB5lf4Xf/M4ZrZK1eOwrf560OVVl//l
         +6Hw==
X-Forwarded-Encrypted: i=1; AL+hErG62BTnSIl0MZ+gN15I1/VxVTdyjAzKKsyFgxsF1sZHRSc+Vj25acnQDoWAIOOJOAFPEbfYA3T09r53oVw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g4NPqE7gwYvY4S+vcy5D/cMjDSTttaqx4x4bLXbaxqqO+sBNz
	Zj8ibAuMyKucjkRBhq7cwUqQuK5uZu8ofv0gLsDlnY2mjDjPlJy+gfaZKFpC7/QMR0o43jyGj/d
	6g4pR+KX3Y5XpXWIuEAnBTg==
X-Received: from dyw11.prod.google.com ([2002:a05:7300:880b:b0:36a:de0:d28a])
 (user=nilayvaish job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:87d6:20b0:386:bc19:6a30 with SMTP id 5a478bee46e88-386bc196d10mr2286489eec.20.1795491241112;
 Mon, 23 Nov 2026 19:34:01 -0800 (PST)
Date: Mon, 23 Nov 2026 19:33:57 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261124033357.830767-1-nilayvaish@google.com>
Subject: [PATCH] fs/dax: use page_ref_count() in dax_folio_put()
From: Nilay Vaish <nilayvaish@google.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	linux-fsdevel@vger.kernel.org, nvdimm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Nilay Vaish <nilayvaish@google.com>
Content-Type: text/plain; charset="UTF-8"

Once dax_folio_reset_order() has turned a DAX folio back into single
pages, dax_folio_put() checks that none of them still holds a reference.
It does so by casting each struct page to struct folio and calling
folio_ref_count().

The cast relies on struct folio overlaying struct page. struct folio is
going to be allocated separately as part of the memdesc work, and casts
like this one have to go before that can happen.

page_ref_count() reads the same count from the page that the loop
already has, so use it.

No functional change.

Signed-off-by: Nilay Vaish <nilayvaish@google.com>
---

Notes:
    This patch was written with the help of an AI coding assistant (Gemini).
    
    Based on next-20261123.

 fs/dax.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/dax.c b/fs/dax.c
index 9d161d7ef3ef..16cad82c689f 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -449,7 +449,7 @@ static inline unsigned long dax_folio_put(struct folio *folio)
 	for (i = 0; i < (1UL << order); i++) {
 		struct page *page = folio_page(folio, i);
 
-		WARN_ON_ONCE(folio_ref_count((struct folio *)page));
+		WARN_ON_ONCE(page_ref_count(page));
 	}
 
 	return ref;

base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.56.1.839.g22a8290db9-goog

