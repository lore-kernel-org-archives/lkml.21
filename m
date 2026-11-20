Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186903;
	b=cAjj8lHmTByriT2e1vuL20o7fN7p96Yk5HW/gfi7m0zPZwRZhUau3wTFaFjNOP4KN1kk
	 wbg7fgyfG//1HSa2x6RvhkIuhVrrsjhFZYzzXcZC/YM/5myjNssduogcvWMyHLI1f7QJk
	 4WqE1P/VeqzZHOm3XczcgW2e8t1iPTfLIBDfc0aRRPfUqr7r3X9ImQ7NHZMuwryacC8jM
	 33cZ7iKATFH3xw7ihXBsS2aYjKAvqVpEA/DYFOH4yG0jTSe11/lTwKA9i9wiHG+DbMsWh
	 X4hKAI93UlyyXZKxIcn2IyF8C1EDKiTMHFFRlp9eRxoc3ax7xAKPJMJ96JtQAnyMTnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186903;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=aUKl5uun6K1IYcbSDOkhJjIoRsG1dFhoyOQzbur6oQs=;
	b=JTMwfslK9GKjajJMk6VWKG5C0bs0NT15vxL7rvlfc7H6OQ1Uf7EuIDG44/2JBRmXapt+
	 QaR2volxS7gDxoYZ/IBNYquKFKeo2+Lm3oFmvk9oRXE+nsfEtEfR+7wep3641ayHbB2mK
	 RXSxjxI5DVAQGTsL7olszgUc8jYqjyouT1UnxXf80sfBx7Hrynwbp/8HKVxcqJuU+Ovjg
	 IUdPUnQF0RFxfjDrHSfq/o0ocj+u554D5YCeo7sE8/NilCsxXVf7cn3zzp4iBJhr0XdAN
	 aQY4OgM0bCAf7jGAuj1RNHgZH/L2TQhtLTYY0Ss87Ce4L8fMbaJMATICdx1HQLkBUmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oDjDQUlr;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B019C606A827
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B019C606A827
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oDjDQUlr
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc147d86bebso561624a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186902; x=1795791702; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aUKl5uun6K1IYcbSDOkhJjIoRsG1dFhoyOQzbur6oQs=;
        b=oDjDQUlrOmSFk2QDYknfQKEG5sCRn84GhjqrmRVYHdQYciNvWi4ANxGrRHRrd1ccV9
         /5SRc+jOgTmuV/gZ7/C5q7CNmRo20O55SOifHQHSV0e2djtryOwvGKHRTy+Cu2dBndSb
         823hZSA+we8AsSY2468ITes+IM4kbp6RwHQkRoUbs/6ToXlSuSRwrrRPl/yiVT+3wV6A
         gXbonlmLCARF0yDx24XMT9Pv7Nc9AaWqhmVhefm2ngK88uPA357e/XzHLTDjSnysNd6v
         2MVManmYPHlrUtGo+gIBDe31vGpYcR4L/sS39mqRUGTqOlVSaUaExZLAzdCb2zTr3/HL
         v4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186902; x=1795791702;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aUKl5uun6K1IYcbSDOkhJjIoRsG1dFhoyOQzbur6oQs=;
        b=awF/R5GDUbTndvSel6Hyy1Jf7eBdca9mk7pNd7egyqwVvt/i3lsguseh6+OmU53Sst
         u6x+nZYjzOh78sw8JEOFGsZYFLyZIZSyYp2ZYSZtx3cRQ9guaWoAr0tf+GaPOy66wOlo
         /K7riJvNsp9dQoqVhz87QvD+prRVfPjeUd4vfMviCYHSZE80PtHsHIpQ4YR6T9kJdikV
         ARJz0kMoyb1zhZ9A2xBrOHqg7SK/iPwCIdEE9DGnIXOsJirmODSF+1G4csPbuVhyjXTe
         44Vrzukt6n6RnW+BZgLAifT7qDQc68Al2mcRkyQYhWY1QzM3H6heYxrhSgdcezp6UXvs
         UFIw==
X-Forwarded-Encrypted: i=1; AL+hErF5h3wW38lP7ZhZN9P/4lFLWHSRcCnU0FgAV1gV427zoNtBXCCQoVhqkQ3ihVbMZE1CYRjdwhoqboDHpXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z84YyF5ezOA0laenk+0FHCOBL0BLc0OaAxCPUBrpQBdoXO5aq3u
	fqCfsvjhZAP1uzkJcw1eukIIYpER80A/3aoRvAZKlEivux9bWMM35zncFMX3cngbJD4=
X-Gm-Gg: AZFdTZfzWUHfHCohRwsFrUYx3L1O/2ciNA4m7JE0EH+ulqXte9EMyqvORo7+T7bbo48
	9VPFkf7VfoZt9VfgivPVZmC561Ly58SZR01WAMZQWzUbD1XYrhqiSEdQWufClrQ7o7SIr/atSf1
	xrgowb7E/Mgt0lz99aQFJBh3pKTOeuB9zMZQ7M9qaJIhdA1r3vvcrv+3qYbDnnQbYFgkLJdtu3J
	RLNy3RBrkC5a3M4IdG96Ynom2zKalHMFqbGYAolkL7qs9wZg9YgHoUfrG48UzDTPwSJk8AvTedn
	ZPqbQs3V6pVMbBghOSDw89hDipRaGVu/VbdCduu/Jp4DkQqzf1TYDHLEAktsdfD70ZXutPGLBDw
	zpCYNc60hiLn8ruRo0ARFUujV4cNtgM32gSxnH+qdKnE2I9r1yWrih9ev5yhyC5g6BtKxAVHHWi
	ubzi8SDX3dESqV+Vm71MCBbyA4FFC87ZJs93LGvUXMVTMSMn6QaKCOUk1rfD3ikYwQI8voPhqOx
	mfLbuQ/8SH0YT5U13jTI4JEy/P8f8lEL3Hzt9NIRVBz1pItoeGWLr2a4DU3D+I26Jg2yPXmSJYC
	CKFVKqKGsJfTG9Nk4UAzHF70MLGIZSzFu2kyMfhKniepbCK+x03a07B5mgjmiKUDKkI8EYZU5Lg
	WzBKGojFRsxvlr7SvztPpwa5G1BHsQGhOdh42
X-Received: by 2002:a17:90a:e70c:b0:3a0:d7f2:5a58 with SMTP id 98e67ed59e1d1-3b41c7bc5a5mr2410758a91.3.1795186902056;
        Fri, 20 Nov 2026 07:01:42 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm4720383a91.6.2026.11.20.07.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:41 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 00:01:37 +0900
Message-ID: <20261120150137.3128398-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
References: <20261013005854.2470384-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 09:58:54AM +0900, Yehyeong Lee wrote:
> usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
> the OUT request completes successfully, looking only at req->status and
> never at req->actual.  A host that declares an 8192-byte WRITE but ends the
> data-out after 4096 bytes still reaches target_execute_cmd() with the full
> length.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
