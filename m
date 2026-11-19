Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795050713;
	b=RtX9R2p72YnYcG9xcNvhoYLRe4IywT7rLtP/eNsizn7ojdxrVRCHsfcx+u4+0vHwekAr
	 bzw51iE8KU3no/kmJA6IV18dCp6tOLPlMJfd22dMkvTvljWZrx+GUzuJryf0NV2XYS3Cr
	 1H6/yg794vq9aQKc9eVOK4KtkxLvZQ5LdZIYxsNfbPIXMx0NwcyRZbYHvTKIvzTGIcYCr
	 zud6S1Q5GpJBffP9KDoMZ8pevY6Iv8zGlfdD+4l22EOON60DWLHBTnjCIVOaBvWuEsAXd
	 5s6j5QLVKiPQbYbBtrZBkK1JTrA3BHEc3qdZF6YOwCyDhmJ/5JXFEHGAgZ/3N73NGkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795050713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
	b=vD+5NDZ1XHIRK3PVc6fF547QxKXH0CfPHjiuRlm8YPjxBusHGQb5nFfQ8i2R7HEQ6Rvi
	 TphXHrrThlhqQGqM6qvGcP3tAc15kFYRo7K1k0L2ru0h0PsCbeewBYJaB1uRIgi5daUPn
	 +Qd/rS7+ccAGMARvd7hwdgXX3u/yP2Icmjgs6l6bVq3CotpaT9QbdR8dkuY4vdcdkyk+s
	 iSqwg975PEZA4tPuV2+MoJkiYdIAzA2t9JE0576bhHOpkPUKC9jPrZ0J+Tqs+O9YcwZUf
	 NmTxG3Iemfby0ELznR/t/yKyVXUc0mV3jELW77Nhb/7ye81E8dFWplAm2RA22UW5TJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=multikernel.io;
	spf=pass smtp.mailfrom=multikernel.io;
	dkim=pass header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="Rmz/xlIy";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA14606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA14606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=multikernel.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=multikernel.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=multikernel-io.20260707.gappssmtp.com header.i=@multikernel-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Rmz/xlIy
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so2526058a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:11:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795050711; cv=none;
        d=google.com; s=arc-20260327;
        b=Ui6Qx6lZCqttWzO3PH17OvCjEfl/Hkpc5ckkoj9aEHaro7L6Z+5Yw8rJNOSXRNf9cr
         sNudWLiuJ4m37Xv1EYZ1ib/oZsnV/hLS06AjdJ6SDON/drUtEJuZ5YBLoTfkZuzoOPcV
         9ZbSSzvZgF41BIfJO/jJnFW2htBuVzJcbt0WBa+Z9S9Ufseb2PUP4PWcfk4YLhl+fm8s
         h+GXVSZgSWi+PlWbdkcvoRvGgZV7YpQL+TiOTPY1fxigSvAOnk2Z/PGSD4R2uWtTBz77
         B/IYt4td78MQaawnDu5Yy1urSkkhxbSF0E0kErHS5p/IOVtFrbr+kW9AkyLPWOq0GLkM
         P4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
        fh=EE6AN3esCYrQYofF/vgXC6kDMMM4ImkKwpfQ3cK1W5s=;
        b=gAAW2P+vdFw/8jpuA2VBG81CRaPnj4vdKDlqSEb+RzUnSilTuVXFl9QR/Djp62yR8B
         /6W728JScpvdvSIlQhSVEKNAv+QBBSO1u3BRQlh2B4e6xEQX7fjYuIQv0DsP3QJaXey3
         hAnEzFB5vZ5/8AK2CB9ub/PYb3d2b8p+29iZjkjg6M4oXVxd9J3NFnXlLR5D5iU+BTsu
         ut+mfWWtPrHapnOZm0dnxfAO0OI7RM2SZPLxOqtVOWsUx+MvIjj9kW2xyLksG2Si5rUl
         wmLmaAsRiSUaf4ycnnOIPnhof9uchEhMU7CpKggkcgt3zVCOeXnRhVUxg+EOeJS87y63
         SwJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=multikernel-io.20260707.gappssmtp.com; s=20260707; t=1795050711; x=1795655511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
        b=Rmz/xlIy4jpyCp7u4ys8em+AZLVdldkEXTn1nJib0gmUcKUqOilcLGwf9lGc1+L1m1
         xyi7x7qJ88lRumztWnhKtl39EskLYHysZJ/gFpSRb5dIZ3jbxu4J0NGSpciOpVRPHerj
         YmbsHueQtyr6c3cqbi2C/+W89LjChuo1puAuZxdrPFpDHJR41Dddw81LiZXqwaS3gRlQ
         eQMPHA4UF3euqCKalY7p1Y2V/j1cumbCfKJxOrLWDidW6kurXDSeUskIA0vhuqhh9wZS
         mNun9m+aFbE+0ux+3UpYlgrgI9d/y81d9XPnW1AYe4tBqiFZGle6/inyPVazgD53QSw5
         MAXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795050711; x=1795655511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zFbr6eHg9xAfwCJ+yPPFuSKuvOw6SPSCEC37J1T1mfY=;
        b=QUqH3HNdpQlUezZ2MalVaiS1VSbxJulUx2nrAU+Eg/js5RH+M2hEeMlZvwusmmKd6G
         OWKjNm4lm/WOvl3pvnpj2yQrn7M08QzlxwcGtL+RFje3uF5r+oHDCKijvLCuuvGwZHhv
         frVOBrM6YfEzx0rTqECH6L67K4yEVN8WNqjRZfKGXoeBfwqpfOey/llGKqsbu9ZlRrSc
         L8eA+2IT5JHku5TPC1tUvEes0mvPR7pJEAdR8sX4ypW3mch1Xxdu5oVFr86SwaMBFGc5
         hBCHlxutsk6qofq2C0wcMpNdRl5dXpwUE8YNroODhKMOq8fhVLCHbcF/BbDOO7Xtgab7
         it1w==
X-Forwarded-Encrypted: i=1; AL+hErE68PkBCYQ/3g5H+QwAIE8muq4qqV0VgVF8HxU+C4HlalwUjuRR//qbbNt80eVaNMhawCr9LIerW3pxy1g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9BOfropBZCJE2JYDu4p/k8c1nwHCVIfiq/SzhB0pqjEorngLr/
	k374f3SXAbO+DlE7VJWOLG54MaVZc8izxvm/CNj92L2xLx7RHroyELG1CkvARPsdrPaDhJbnFM0
	NTtbDLdKJ6F8iZcv1vkYvtA5ULqi5RohRNlm6wCv1Rw==
X-Gm-Gg: AYBFou0bA+Zby7CtFkifcoY2ssgictswvONZWGhvhBjY5jLIAAWSTvyZcA2UAhrKbIl
	FJT1rNfVRbwskapWCqkvoO2vIaLTGgnSm7bt29eCdwexNNhKSypWfGTHT/5vshu8wxxvUJftVtr
	RD/g8oA2UIzUimZPbekaZWplRGRUOJj328XN/gsKpuxfhsNVEuTRT0ShfstzI6lpWxt7pKtu2+J
	LvGWojMbM4tyGJ4eJq/5luJJHdHVXjXWn4LB1qgzfAVO2UjPxJrM1GTdLGO/P0uWafbDc6+aP+A
	4syHxtUqdJGTLwRa0rcwnpat5AZV75zJzlB3bCJbvJvKW1iQhw+dVok/VdkApNJPGB1DEpm3xyw
	bpZLmYUS3JM3bo7wVfEc1Ur8FHtKtjbeYaAwmzBKTHH2fU8RoyqE7M5Tf5v8kXxUwLndhDIY1WX
	8Ce22seeA11cCZ4c0MsV6htFFc/Q==
X-Received: by 2002:a05:6402:1d4c:b0:6b9:c43e:19df with SMTP id
 4fb4d7f45d1cf-6b9c43e2326mr963366a12.41.1795050710871; Wed, 18 Nov 2026
 17:11:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118013729.576325-1-xiyou.wangcong@gmail.com> <av3Q8pAVt6nb-RBc@kernel.org>
In-Reply-To: <av3Q8pAVt6nb-RBc@kernel.org>
From: Cong Wang <cwang@multikernel.io>
Date: Wed, 18 Nov 2026 17:11:38 -0800
X-Gm-Features: AclHuK87b_shKwat8_ZEwNyuTNtkbEeG4EoWTL7eT71aa9I3nE0EPfXoTHuPeag
Message-ID: <CAGHCLaTb1HhPXMqakdErKhrCTWcQ0arqKDbo++vp5jOkmjQ93w@mail.gmail.com>
Subject: Re: [PATCH] riscv: kexec_file: Verify the signature of Image files
To: Mike Rapoport <rppt@kernel.org>
Cc: Cong Wang <xiyou.wangcong@gmail.com>, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Andrew Morton <akpm@linux-foundation.org>, Baoquan He <baoquan.he@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 8:23=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hmm, looks like we already have plenty of those. I believe before enablin=
g
> those on riscv we need something like this:

Yes, that is a good cleanup. I am happy to rebase my patch on top
of yours.

Regards,
Cong
