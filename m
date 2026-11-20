Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174283;
	b=0DtRATesw+wo+Rz4WKY+mfVlLknij3or4gxVgJ3msBqeDTcAcukpi6QDLk7JAac11i+V
	 Bh94PvWeET0JW5w7tUiuQx+Gxbo+tDFWFP7V95Kv9PzIZ5PMVcqbAlzZv7VcjpSc2Fook
	 876QDEeRTlpJIMCQyxM4uIoQQFTM26rFf6fvh9xPwoyMnEivuMK+U57Mbq/8IR5XYZIIv
	 qKu73lF+EpF6b6RfTd5gM5oyUunmsIOgovZDxHftr+BkiOd3F8u49um8ApQvAUuTe5T3e
	 fgaJ0KUKJg3Ve7+Xr5poLMbAI5UPyke0HW7Pr0uSXsOMX/TtgHYzhaUPR99nfxK623w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174283;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RX+856AUzmCTNUy6Uoa6YuVj+X3zQhsWSDJ5mJQKXuE=;
	b=P4YEWZaIAS2Wn6lsnMPggC12Ic/7U8+v4WSvqVYN0gGlTHkiAoF+PuUZitZRRE3wVPY3
	 slOK285y8ZoNPehKd5MqNR0rGUt32oDzO9ur3xfd0T6mTQdPjF40A3XKds16105mfwVTV
	 8TMiGbSDoHZsYtACZDcM50RYTnEe9n7xIMw+j75hyxkuBHf1IleN6H7OX5UjJm9k159BT
	 kR//gUSy7Cb8uFGhRh6ktB0v/yvyPU/GU9VjnE7s6jcVLc9QMkCgYsR2dPtB3tKUPoHnS
	 rRNAddJUK9SlkaAr3WglyVoA0PWvTTWygMNX8AEJBTLUY9OFt7gGcBGaFduyJTBybqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d8Vxng05;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D701606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D701606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d8Vxng05
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde1479f76fso531356a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174281; x=1795779081; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RX+856AUzmCTNUy6Uoa6YuVj+X3zQhsWSDJ5mJQKXuE=;
        b=d8Vxng05FQgd+fvSGYsdHS5kgqtkzPNIz459SZ0oYQW/AouySIMAngko5Z2WRDOonM
         Lbny+vFRNti8nv+xdvTzCkZ1RCHyMXDtMPygPkWmtWpX6jT0RMXqOstAkgeH3pvROnGD
         UOzmqYy7h1yPOzvakLnvQfPt80Gc4oay4wuNmhmMGl434SPvS1fXuIhlUy87tjuvpfSx
         e1k2ts6CiQ+sEujcdCLZsVk3CsG7Az7qLLWaROFPqBueMZU4f0G2pSZ1OOrrd76bSYOb
         Bzoo+nijHDZsii0L2lCJAu/xCKY6HB4t1T4Sn0CdqJ2EzyID6uHkek2ARQFrYLx9sq2P
         GCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174281; x=1795779081;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RX+856AUzmCTNUy6Uoa6YuVj+X3zQhsWSDJ5mJQKXuE=;
        b=xRE70IwgQacDbuLD3L3T2F0TTIA1MRnpeWxY2NusyQPFNtcJt+cn4CTX7zlgdf1emA
         sQx8ZdQQqWFGv7oKpZ/J2jvqQR7+S8uoupgnSEJuUYjFUr++12cwhUtvSYYn5BodKE5S
         H1aqGJHnKwyy6y9OXtO1KXGmBwSxdKa1eYQnbuyfvk436QH8sXIQAPXwpQsAorxda1hd
         eT+kQsSk4j3Ygo951wiTEqC8YmNLtw1NLroK1UNxIGAWOTvhUWeQsCFr5PsZx1k+m9oC
         PI1zMVl8n/gGbA93XyMvM8eXMN5UYGbNfrQdl6eKfG+TosxPMEowdolgeny7ce6TEMmN
         k6Jw==
X-Forwarded-Encrypted: i=1; AL+hErElilWQJyUrDTHPbzMw2VBqoJXwZXKq2Plrj+5oS/U1jwSn03oMxnLw/1LkYLfJarZNNMInE/eErmbiVDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LA5WMlfikK5i+QC9+D4bQqCrCV9aTNl7QuDm4hJO9OeJ//3dB
	oRSHq/rmIpmDEby8URC+RZ4kjeBvneuy+mdSTW8kmkrWDlRP1NYMiMWuwSOsd69/8I0=
X-Gm-Gg: AZFdTZfz9dk++SKw9HBCQOaOt+h7qHIRjW77qzae11DSV+aFTiIP6D5lyhhfpjhgfWg
	XXyQTnvX7S3b+I3vXVXXaWOJFyiZmhwTLyn/5CyaFjMjMgt8KsSPeSkhG9frOq6s5weHuh0ocmn
	JxnCoCto5s/QMqkhMm8eKEiiv50AYWL8YA4ufuRzoKm1pLGvWtqYBjks4VyfVyNiwp8OAt4+n14
	1fsTg9djn5y6IPpeVJWlSbdn8ubq49egI9Q5Zwve81ZHPiSq4L6aCVnviQSACoeyKJK7O33J4Cl
	tPv51chDQmEihUWtosg5WeVWnJ0cuOGE7JEtDlNaqfRBuqwn8Gq3+m0VeycjvuAJ5GW4Xji+EN+
	c19ULasIhknD9puOLYW8kI3dC4wTT0W8QkMqLkvxDLdUdJkFDMdkSewMGCva5ZSXzqhnBG0tCr/
	LjcqfXoei/xh57S+1p1lJKIqkcZj16v1x50eqUl23PqYvH535JCMekopi8kBBqPQXZTNYmcJvSC
	IVUjD5QfOixrzatZhrvOwb0We68Ft89oum700t2tdeKbZLqO6L2YSQNbkUds4hBYwfN4SdE3T0j
	Y0+sI+Xe8PjBErLu7aJyDx70JMGFnDkeQjWCPHSLIzK7G5TBXB30MpslMrg//aIkTCKiy6igcnt
	P8YBijuj5IMRxvEf6rlJbdB6PB+MN1rYKUP1K
X-Received: by 2002:a17:90b:3f10:b0:3b3:b8f1:f152 with SMTP id 98e67ed59e1d1-3b41c7e1414mr2197961a91.2.1795174281280;
        Fri, 20 Nov 2026 03:31:21 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad47091sm4104731a91.10.2026.11.20.03.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:31:20 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	linux-usb@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Fri, 20 Nov 2026 20:31:12 +0900
Message-ID: <20261120113112.3060035-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026112028-starless-aching-bdfd@gregkh>
References: <20261013043951.2534225-1-yhlee@isslab.korea.ac.kr> <2026112028-starless-aching-bdfd@gregkh>
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

On Fri, Nov 20, 2026 at 12:09:52PM +0100, Greg KH wrote:
> > -	if (req->status) {
> > -		pr_err("%s() state %d transfer failed\n", __func__, cmd->state);
> > +	/* a short data-out left the buffer unwritten; don't commit stale data */
> > +	if (req->status || req->actual != req->length) {
> > +		struct usb_gadget *gadget = fuas_to_gadget(cmd->fu);
> > +
> > +		if (!req->status)
> > +			cmd->flags |= USBG_CMD_OUT_SHORT;
> > +
> > +		dev_err_ratelimited(&gadget->dev, "%s() state %d transfer failed\n",
> > +				    __func__, cmd->state);
>
> Why is this needed?  And __func__ is never needed for dev_() calls.

It's not needed, I'll drop it.

This is an old version, the current one is patch 3/4 of v8:
  https://lore.kernel.org/all/20261118124005.2428068-4-yhlee@isslab.korea.ac.kr/
It has the same change, I'll fix it there in v9.

Best regards,
Yehyeong Lee
