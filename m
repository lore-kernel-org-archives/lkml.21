Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630961;
	b=L7DeoKpE2a7WVUjfMHhP6C2UonayvDtU1mkcIWnfxx8HaesZsuepQ2T1/H9Mr1UUXQ2r
	 cC8EOBgT29LSHKN9owGXCkWoZ7G6qQ+sTE62IcMzuWgDWEfUeV0FfiNOdzw60eGuDXA0f
	 foRjYSqBi46fbYbLs9AillpekPnQwOFDlHPBlcOsXX26a9U7imwW15n+gsgIew9ABkj0H
	 P/KFuzQEJ1uqKaXSQ8yPlmRHjI32t8ArjAwb8xN1Zr0/a59XhEK6m/KjNo9V8aECleixN
	 Sr1xo54QtvMMfc4XbD5c2Df6fzuOHYP0Io/315WCWiMAA43moKJnt1SwYiwvNEqwqrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
	b=3mLr+8a6s6pBpnR5/pF9Wrj2WBVv1oekgEAiccXkFD4c6d5+upM2KinphSyGS8I4r5XH
	 2QVKfGcsrniO382DlqNQvSrdV1sPhgXl4wao7tDvlLMtYSbvZQM29PgQtnrCkBK7vq995
	 ccPDHuujLPVGBAYFZRzhiXTgxZCoFUDFq4/0Nrh1GByNOqa5ZzAbd7R+jnDtUTcl3iwPS
	 v1rqhvixwHqyqFuJBRRaQr7uFBZ81J8Xk3t7EFM/9E2W7nvqfVbkwBwGUM7K2Hac0lm7O
	 bLu0E+FSuZqZBA4hE8UcEYhoGB8tMDczXLZHJAtGKxUGkvubWMU83KBkazQAFA5S/mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XltHJeJc;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1AE606A332
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1AE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XltHJeJc
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f052777c7cso60421085ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630961; x=1796235761; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
        b=XltHJeJcafnoz7rWSdh67DNM8cUVU33Kf/95Saqoq1SakVT7WitG6OsBqDZPGchsCE
         y/G1PGTFqEJu0lBEmJpEIiHh2bs+IcYU8n5pRQb6MCXjpvL2vVXWyjr78fxLTeBKFKQH
         LbZNOzgfAlbMrtPg3br43/a0SJZBBByAaTgwqOI1btWwBNj5Ty//bbU2AK1YZTsmpv+P
         Rx1sqeQZDnE6Me/PAQ2VZSIlCF1Pj+UVs+co5YrbldjuVaIcAFJ5jyFNTi9XJNwyBgom
         juH/Li+nPLPJ/sXNQ9fbhC3+mMLejxLcvsDBSkMQCDsTkfuIdqvNpOGCTIPpHqYCNwEs
         6FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630961; x=1796235761;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sfEVlacBV97ie02thpjOgM2D6cDC2tSVCZoWDEnfrKo=;
        b=g9mbq6ZEJC+d3Tf6Msix6EXbPGlAEVjvGYKc2AvF1rCaqwrPVNL1xYlZOa8P3Petg9
         GRuDHp5CGD7t2+zwsDSv37NWPJiYkAXtl+JOUWALrbnX/Y39Wk4BBIxtHbose8558YTI
         v5uvpnjy4w4Qs63nWXEBtA91fQ1JxrSKNyHTUbGSpxF9LT0l3PxK44LhChSOYom33FUT
         e2PPFjIEQ0/zYw4O+ZaNRywftOU6AqbgfPBhNlQzZ1nZUYzGMfeJ22JLBgVwi2vff9MY
         s/Md4Pnhay8MgI6nxgn5oQOJ6b2UQjzBvwzP/+vQLHg+JFUScjPB2l2ZTcsJPBOc961P
         Y8dA==
X-Forwarded-Encrypted: i=1; AL+hErHzJ+er1+kHzHT3zrWjP+W+hThCejiSojApdbusZ97z3o5zN6ubtQ2uUgOeujEGbo1sqZffTfqvdBkC72I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o8cy0RdiUZK430cGcfC2ohvsTc/bHDfkPnK57DNvdEbloSz3R
	43ryh0fqFiSre5j7gWa6zeJzSxHbgo1mZpctgj9to6UXD2MOWCfOz1gDIwzIczxxqyTA6UeXx+x
	DRuS2Q+tZC47HRCb1LvwLfuZpWmZNPNiv7Q==
X-Received: from plau5.prod.google.com ([2002:a17:903:3045:b0:2f0:349:b3a4])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce85:b0:2f0:3e44:4761 with SMTP id d9443c01a7336-2f03f25e801mr195497385ad.54.1795630960732;
 Wed, 25 Nov 2026 10:22:40 -0800 (PST)
Date: Wed, 25 Nov 2026 18:22:40 +0000
In-Reply-To: <115e024d-f49b-256f-550c-7a64b546a076@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261125-pcie-link-endpoints-v8-0-19d49c17c05f@google.com>
 <20261125-pcie-link-endpoints-v8-1-19d49c17c05f@google.com> <115e024d-f49b-256f-550c-7a64b546a076@linux.intel.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125182240.2292209-1-rathodpriyank@google.com>
Subject: Re: [PATCH v8 1/3] PCI/ASPM: Add internal pcie_aspm_inhibit() helper
From: Priyank Rathod <rathodpriyank@google.com>
To: "=?UTF-8?q?Ilpo=20J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam <mani@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-pci@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ilpo,

Thanks for the feedback.  I reached out to Manivannan, Bjorn, and you on
the ASPM thread to check whether Manivannan has a v4 in progress or if I
can take over finishing the core ASPM changes cleanly first, and to align
on the per-state counter API details before implementing it.

Also noted on avoiding bullet lists in commit messages, and I will fix the
port->dev lifetime issue in pci_lmr_release() that sashiko-bot flagged on
patch 2/3 when preparing the next revision on top of the ASPM prerequisite.

Thanks,
Priyank
