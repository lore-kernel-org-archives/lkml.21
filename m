Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527288;
	b=Ez97wpyKwx6dG7gWIzwyRgV6OqR0tmrXj9S4c4cfOfO51i1bSgtVOw/EsBopmrMfrPKc
	 CrQWcr7VjhJKe1qiDBIc1qDUzqiia+qGyvfMyO3xCY3HcTKgURRWtcGjdu13H5oKntdjN
	 YLr+09EF9obiX+IbUtSdUdmn++K2gWAhDIP44MreziLhVcKIRxNSiIjg6tmEQWgst+IWN
	 yOmQdXSJiMcyzpoo9FWLyHpcsUddT6rUrIPcSfiZCseipK6zDFAe5tEs/GCBjGr4gqtQq
	 4X8cWFqiIH0W33IHjlGXc5hirnCa7+pI7hPCKFs8MBY6UEAaAnj9GTFP58qeTtP52HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=HJW8lCu0LwjPi/yznQ1wwCg3MbHuP8qP0Yz0AXfMEvE=;
	b=hJhkXJPS6+F1KVLQkathvXJzktprqgFVVyKsvxMCs1KmlickaRaJZrvFwlbOhHR4lXle
	 6pAuNeiMySWI5uQ6NXHggGg2kSwqleGrMdt58AqEIKPt2f2VBa9n/QYlT4YmA0+06tko4
	 g9V3ViHI0P2/FfCBHOwJZ4zgut9nDIPRpi9/wb5BjpImO7mckRpnXiO+bHQW1C1x2WVoS
	 0ore1C7/53Isz5wAghzLG/L3uim8AlivC6MoxRO7fsJiqz/P6Z1i25uxwjesWdOW+YWWY
	 qgpnmg8aKCZzqMP/kEAZi0Q28VdnoOfrLx9Wl18/F+QMsov/L2ro4LkaA0y/LvJZO1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YD3R5opB;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A0C606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:34:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A0C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YD3R5opB
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38644aedba1so6950924eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:34:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527287; x=1796132087; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HJW8lCu0LwjPi/yznQ1wwCg3MbHuP8qP0Yz0AXfMEvE=;
        b=YD3R5opBT1lfX98nfjXVonYPqAjoJ1aGohJMHLTBFpcr4UHbONARRICEYVLGlOo8Cv
         G1LgOO/JBYMngyBCB1cPDz5seotwizoXNIcEFMnlGBVxXKUi4lNM+IQdZChID5m/DnYu
         MXnPZauNzrYJp9ppjc7xuvLZLOf7dOTZKvYzBwNR8osRxRQIDpsM1YxwYcmPFBWDRQt4
         DvRQ39IgNtAETWQW8v0h/GswGOkf02lijPSIIWpw8zp4i+m0lpqp2DO8DeYWpMTeT6d+
         tNyLGRLHYPYHSorTbDrUt++XuHBFvbHrnNMjUXybA15x0Ry9z/sDzhjK1WLmxE/JKq1n
         uJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527287; x=1796132087;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HJW8lCu0LwjPi/yznQ1wwCg3MbHuP8qP0Yz0AXfMEvE=;
        b=ioNLeEujfsiTQSwwAZASrlAXwTbfS93aTxle8W8v8U+BYJD1nLiC/LD/ea8fguMNm0
         ZWdJuDKlJeti6d97P8f+QjSF/7dunh0ju7hZq1aNXKrpgzKrE6Zyt4TPKo1Cq+BlLC1Y
         XR7vq6FfmXDudrZ6nEFoeeX/GsFkISOuQhbjw1KHrB8V4umAy1vCLzsfFbiqSnhrNCp9
         3/pLphtbzDlcoV6ztRu/t2gFkKbLm/fugc+rlNIv+32u4R+Ee9Wg4pqfrVz9qlUXigkO
         xzttqhlu24Tl8MpSlc5T5CdboFlksv3a66TpdzoOrpvczU4N7eDwy/0fqWfKEeb4ygDH
         WOgQ==
X-Forwarded-Encrypted: i=1; AL+hErEOoln3SLk7oPUGLxGkIasUhdFI3SwYf4JSFONlIbhI6TNtkCyCaRgN9sHuv5rZINGSedBdFLg53svHyCE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cjUNV567326ledKEDaZUBq3Ha3sx8AVROFNlhJkKsjL+36+nH
	guqjk/+GaBFZ57taKcAJaTg/2D03o+JIaE3jycjikEWCnY/uau+GHqfs
X-Gm-Gg: AZFdTZek+Q5M0JiVNqfJB9LmnjkpZ77vG0ZKddQ1FJ5uZ/9K1/dZXe3gAsHdYTY1TKy
	cRXRnJcz7HEZVuIW+xhTE8stHg33ZNGR5JISmJRKvFxrURiPK4Mwh4znWIDndhHr0maEHVAmNBF
	Rnb6m4FU/QvWL+/EgxzUCieuEy2rlqNWAV0AKSqDN6Vc81F2CUNbA7f+iz+fgnepVUtugdjjpNg
	xwgsUdK3xXnaW/5t3RlZAnvtS0TDI/z0H/yXCpHUeNQOzPVBZAhQdvCEAcPA6NloPO62n+hoiFU
	R8Gx8qFYZPoL9AVJ9Ip942xo9BirruJiTdXvTzoD8wDVEdS8oXoSq8/qr1lQBl2jdE91nOl83Tq
	/Z3Dxs3BNok94Tk51Seec5ZUqOY3kd1MmFUvTSp4/qj8yR607vcLeYLdkiHl/vRuUmUrgmDstd8
	vLvQMW/tKIMoenjFMWtkSnDcdHMlee/0s7ywTSHqDBtS210NKxKFxlhojmWhjPcJT6IlcPSOtFu
	c0H3mK6LGEup4vI8csEA+l4V9IlWM11AnpwYFTNNalHcEsR9Sux/UxgbQADq+xAJwyU3fV2YIgw
	W9fFnoTTAdd28Vy+6Y56gJln6tuxnjm7KHXzQA==
X-Received: by 2002:a05:693c:8641:20b0:383:50b7:1d78 with SMTP id 5a478bee46e88-38571223ee7mr16750852eec.40.1795527286504;
        Tue, 24 Nov 2026 05:34:46 -0800 (PST)
Received: from [192.168.29.85] ([2405:201:8026:213e:1412:77ad:61f2:79f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm54267035eec.10.2026.11.24.05.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:34:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
From: mdshahid03@gmail.com
To: Paolo Abeni <pabeni@redhat.com>
Cc: mdshahid03@gmail.com, Jakub Kicinski <kuba@kernel.org>, 
 davem@davemloft.net, edumazet@kernel.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <41103c9d-5c08-495a-b5b1-66fc15e2517e@redhat.com>
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
 <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
 <179544969959.175192.4403952228876691788.b4-reply@b4>
 <41103c9d-5c08-495a-b5b1-66fc15e2517e@redhat.com>
Date: Tue, 24 Nov 2026 19:04:12 +0530
Message-Id: <179552725231.187861.14163919455346118294.b4-reply@b4>
X-Mailer: b4 0.16.0

Thanks Eric and Paolo for the detailed explanation.

On 2026-11-24 09:56 +0100, Paolo Abeni wrote:
> On 11/23/26 17:01, mdshahid03@gmail.com wrote:
> > I think,I may have misunderstood this part from NET documentation guidelines:
> > 
> > "The commit message must disclose whether reproducing the issue required
> > modifying the kernel (e.g. inserting a delay to widen a race, or[[**writing
> > a loadable module to issue the right sequence of calls)**]] or using error injection."
> > 
> > I interpreted this as allowing a out-of-tree test module to produce
> > an issue,provided that it uses legitimate kernel APIs.
> 
> Please do not top post.
> 
> The problematic point is the 'legitimate API'. Adding a delay under
> a lock is legitimate, de-registring core functionalities is not.
>
> If you want to use a kernel module to demonstrate an 'issue', such module
> must do exclusively things the kernel is already doing, it should just
> enforces specific timing/sequence that must be already possible in vanilla.
> 
> And if the race is possible only with such a module, at very best the
> issue will get low priority.
> 
> /P
> 
> 
> 


