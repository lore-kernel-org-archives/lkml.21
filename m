Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186857;
	b=epbbiQXMIgrxZsnF6oqdFrV3Z0Litt6zxINwYGXheGizeLp2e54f6Urqfq0AahczzZB5
	 yKRwnlLFwitO4aRSy37aVPHLmRaj6XLBu0b97w1OF33m0PopOfEywJ0vI8wOGVXDg0shL
	 1VCxaDAWs5xTtC2wemgBNSwq8tBMo7XjtQh5lE6LhwRoW+xGSbN1G98cMzXRyu93fRphX
	 eAmOWunTVMtVfuOkZXDNeq4OBsTa/RpeIjtT2IMErndZOctoflwCz17s72Cym8AtXOcrV
	 aZRPKegmUBxbiGWlwyfPFSks5nLflTrFRLoPYWBAfeI9hPeDXHfOYvig5oMT5zSksYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186857;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CLYhhjLA1rPX//UOqA5Kzlj7XmPG+j9qATfDArDSoQY=;
	b=zx0bFkCBF+zh2351sMR2U7OR+rP6uGKiSTpEuBhyU9gyeNd3Sa0gjkLw3vmp9wmdbmMU
	 vDr5H43tNW/y3Evw81fes1pMsFq60xPPDC3gaD+qqX2niFB9uG3PPrB1H9ih6KCcfGS3j
	 lAuLdxOpqle8tk8HQkNlxmVaOU5nUOD0TGCSkwsA2tAJ2nll7xlMcj5j9G3uJJMcofNzd
	 WY0XL8F3BuEMtZuQ0eX8S0OLVacIEQz+xOKlZgUIN4EDuebBfgER8bFlJcMD47o1iiZUZ
	 ya4kXSW6Ip2N2YJCsFbKHmQrFSt85t122eJkwf8h30OjnQwna4kCvjVuK6gzyBwEahQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OfFgzH2i;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4777A606B272
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:00:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4777A606B272
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=OfFgzH2i
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd8ba7c2694so456905a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:00:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186856; x=1795791656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLYhhjLA1rPX//UOqA5Kzlj7XmPG+j9qATfDArDSoQY=;
        b=OfFgzH2iHlchoKwMpuHtI9H2gOdMSf4eimOyL8qKFyJ74E3pXkR7CFyP6fySVy3Z+s
         PNmscrscYms6054DTOGCJfJyVZEgU+G7qDadzNSAOhwLSuK9IWN5l/zBZ0uPkyBG7SF1
         YFty4HUE1LeEa/7Rs386jqkTstTlqZx3nYoXfOUu1OOQq4wtwBUtHxk026Wyi7cYlnau
         jYjTGbvUW/ZzYn/f7JPdzlVABLV791f2to+fFq2OkkAn+1MaTG1yv6gXbkdrcJuHnlC7
         Fuc9kScKoNZliCbsw/NdlbxreYF3ZDJYKZST0shbjIh0tY8hVhVtmtad4e1qD72Qu1dD
         f6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186856; x=1795791656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLYhhjLA1rPX//UOqA5Kzlj7XmPG+j9qATfDArDSoQY=;
        b=kuBpbNQvE8TBnz7SW/yNUHDHEYvouq4GGaoyacgPFfYfbu6yVz6GZRr9bAnzMfeVsp
         Fij7JoxDc4kAHE6lfEztiMGbgWKxHS0LimShs5OOd7HWdv12jEe9T8kebpIplSmC1y48
         rLeaViSvPWntElAVQQqlxEsilLS/o4LBpFripdekHXb1+k52aLjUnnuHPVvFAV/RojkU
         GgGWJXmrhDLDPhiFFLXB9UuVNGmSe9h1ZerqB9y5UiEl55k7cy5/F89rCVRQFCkJOsCI
         3szR0kncr0uVpSZ/ZA5H/R6q96LnQDHfTkHs1MEV+S71nwLrwXebR3n+NYq0KmzuFd2C
         1ggg==
X-Forwarded-Encrypted: i=1; AL+hErFBhSGl+6pfGph9ali245LS+x6aQ/tQY7JPRzUcdBrpsnZBDapnQbcB87lp2Y3+zyW3ex/TrcMMMCSOueg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jELZ6hy11P86hx/otsWVm8xXEQOQKKOKlkKe8hUYGoc5SVqkp
	33wJ8naPkCfPDwviO9yeRCE6m+VWRw/XfA2Hhui8gdS68Bge+8wDeRY4/4/pDlh8Tnw=
X-Gm-Gg: AZFdTZcCCA/C2e22x7Myxa62wSbmrhk4BqLuG78kiY6/cYH1BzWlpIRzGGBSqqlIO5l
	j9zoG0mKXDXuej7KYpGxiaSYBDwXpufNVy5IOb5B9FFKy4LdMvWt4iSkxlDZBzMqHJI1iR672kV
	vgwmis3RLNjj/Mkm5G3DYH6xFHo+ugEE+BjuRc9ZaG//MZsueBoRGjKtw3Bs6xiWlm+pZuqwDiL
	k4NwR6QjBfYlI9M1ADJ0TBVLvW827nUJZKT6XQXMtbqygwSob5D4gtkXmfvSnJaZ81+PJHOk5SA
	f/TlUM9HQzWj+o4YlxzhLsQrBq3E/ULh6vORUMTPDas2jo4L4va1rXaaTHw0RWopg9LlAwzdqKa
	hnHxMKY1WYPbZHwrKJMmtWP8okzQb6i1LA9Ujym0VvfYvFt/yGlbZfH1je8rFjydybqsYXdZiuU
	vVHMx9gjaKnXJjpXC3om8Le0y9tvioui4M/L68yXlQeJYMq1fNB0NIfMXTNYgyLHLrfF1XENo3m
	BAU5LSWvt36KgIJJ0EnZKuUD8vEVepOYbD655Knfx/EYdFnDK5Siq9jA/tZikFpim9ZozBtFLnN
	Y4RkiKCOE2X+iwVrsoGxtpo0JSwJSSs5/0TCAiYRMpvhXnIIErmd7MOfyzososyRNj18WKWxZEy
	nBQ0SHcjvhZllMcHK6/merz50kO+oiDH4SofZ
X-Received: by 2002:a17:90b:48d1:b0:3a8:59d3:530f with SMTP id 98e67ed59e1d1-3b41c95b41cmr3118371a91.57.1795186856498;
        Fri, 20 Nov 2026 07:00:56 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d028a54sm1333716a12.18.2026.11.20.07.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:00:56 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: bfa: bound the RSCN event list by the received frame length
Date: Sat, 21 Nov 2026 00:00:51 +0900
Message-ID: <20261120150051.3128261-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016061513.962742-1-yhlee@isslab.korea.ac.kr>
References: <20261016061513.962742-1-yhlee@isslab.korea.ac.kr>
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

On Fri, Oct 16, 2026 at 03:15:13PM +0900, Yehyeong Lee wrote:
> bfa_fcs_lport_scn_process_rscn() takes the length of the frame it was
> given and never looks at it. The number of events it walks comes only
> from the payload length the peer put in the frame:

This is superseded by v5:
  https://lore.kernel.org/all/20261016155441.1607196-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
