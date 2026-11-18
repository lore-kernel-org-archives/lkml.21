Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795005698;
	b=yZWW1dVg8MOO83F9ANgMJi2yhD9kwoOFUin8nA+yv0j7sSk1T6s+tt7IH6cJs3GW36+j
	 SKadRcr+oBevrnoiTy1gVFTJbmD6uxd5FekaAOmo1kLij5Iy1KxJjIyVMv3NrGtYhjGe2
	 vVPsX+B2be7FxLiPN+24jccbUy5jw2CHaYSyPvaoQA+WH0gg2BuXpA5gWsf7K+MuaovTG
	 XYTMk7SoCHS5EfGpaFB8eBpVRpHG1mkp5JZxTb+lAxQS93hiKXPvwm+KadK0i5hFqcpQT
	 MCDrnms2uHbDV1iK/51WLuUO4pDHTgGBtVXkkE1p1OioQtyLo3tnd8sJq2RKr2yRkmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005698;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
	b=YujAei5WkGUVkatxLS48wjYWytEQ3zCNm+iZl02PtjT2lMVOXjYqV4fBlbWDWdhq9V2D
	 OtGXhz608qFSCvAtZ3OPrhBimEFE8GRGC5w6OdtzdPD/zPAfup6X+I+0OomLN3mgq6Y2Q
	 UYAN1BGNvJEMjnlyEkJzQq+VFgddosbTrX4s20CYYDGQZcpsgtB2g/hr+uEkMtS/t67vi
	 A9B4ZtY3IH9RoPhf2RaBVZVJbpb+vmr9e8Z7gx6cfnWC/EABRNujUL3PQ6v6BDwZWhkIN
	 3RxfdYB++SG00yIxoyfsARzps9ZUGRgXey5mtDED+ybN6mgPO8MpEBwGqd4QygDOdmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="WhBlZ/yZ";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B0660A2613
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1B0660A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WhBlZ/yZ
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e9ae391a05so5261285ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795005697; x=1795610497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=WhBlZ/yZxXcYb7YarQ2nn7UczKWtdcgeVeO+6ldy4EOoIJYb3YZaZjC095fV/8pbmq
         HpSqbZts9dPVoEn09rFZQjsDt+8hRqjfo4Kud5wn2XWfdbl+8FfVmf3C/LhFUy4DfGfw
         PYuafEvTsrjWCHjhNXlROmzP3yATggGmR1Z90hI4dbi70UxIvZvY4kNp+9YicdHv0lcW
         kS6ZG1VuO3rip22fP9h4OXQFVsfM4UjzP+C4NosqMqpKRy1xwFchvF/ijdHsTp8u3/1V
         cylXYxcVXggW4BbND0xySCXoCZvrVe8FBZIo7Eur1e5grb1wtbxfD6Q/6ERJbJuPa1uQ
         cbwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005697; x=1795610497;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcboF+7Ibrmdu8GyKDhEBakGgWL/6zJDq2Y724rkq5A=;
        b=S3n0T1O873vaSS9spzKnkfMbB/jFTloewJDX+pJT8Aytz8l7w2rUGrQmHXpad1nokD
         dEC7ocWn5FX1Tw4Ed/qttGiGNsC5jOT7TfI2aseFdElZBB80wKC9Zba3itPZFRy2MCX+
         TCHvwy3TsCsMedii4ZtxQIEQZRQBqDK8CySHJn66CMrfRfZh79H4wtdfBPXSCLJ2D1Qb
         +qk7xozHOJee70wlrnFeN7La3sVW1Uqc16cNsRK2xMRdlfIJA6NDciuy3jX6XpACsfS0
         k9qqk05zOPXVZoK9Nk922ZxdR1XygbK/W1an300nAp5+EWdAjjb+/KlA55L+SuDq40u3
         WhCg==
X-Forwarded-Encrypted: i=1; AL+hErFwjhn/he6P31f4cIeQq7hG6/CcqffSf8weuJin182dw/6PbncYZ2hNFti91EZU/LzFqvQS+A0vVLXqMFw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OopsIjJzcNXeS5/jYjZvG5/4u4h0RGPrzlKDqZ3ZIASuODLEc
	6mDvrvGVaUVH/q+684R01eQL30Ikq7XBSExgyHeEjxyJInDXeiNx+m9YDDZt3GL49UI=
X-Gm-Gg: AZFdTZdvOcOSOevJk2swHb93+R6ejv+2i86D0HfUl/Gf51Oc7UaHo9z879+MgZSLjBr
	0pbMP1T1LU9GKNRZv08vxtBoovMWLAUobgnMgmOR6uUQEawKrC5oiPu4OlOKQlAL1I6jIN7gb0N
	utwxYqWEikUU+oP35jpbk3FvUwdlO6MYXc/9dufGy3DRmmH2eO5HHCtSxZtA+3+/fSCWNX3aIGG
	Prz7gBJXWtGeJ62wU0Nt/tl40DLuU1Ase+2UuepcKYZBW2WZteDEvCK3gTZx4Yt9TrwiqAOws8K
	KwmhfB0WP/tdshL6x+44EJiFBua89mLvWq+Tvodi9+hiRtUEw+nLbZmoq+zQv9qHGf+tricjnl0
	bRKtHb4IqGCLnbRDmfdoKUfJ5a4TbQ1j3wauCBuqlqQGQLEM+U1y3cBhB0v3ldakpYRU55et00M
	oyPzw5BtXfo8YkSUDRZYveeTMcc+VdCwWZ4mFVuNU8YdLFJdmWZZW02ZNNdF7VRq6RfkFod/R7z
	hp+5duK+CVLmyEBiaA1NtqvBZprVniVmnnJtHNjXtCHuUsO3ToEuArIm+Tb3TH70FtkdkVqwAo1
	XAGWvyaT0xHX5AXt6cv5wxLhypT2/ViPBP4Ggy1pPmKvKapnAzY0qaPnzGrztt5r/gDKBs4Oyha
	Qv1pv7QHW8BSuWSxaNyjcnCTtfKiWUxxKKQHdSQ==
X-Received: by 2002:a17:903:4b4f:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2eff754479emr17857265ad.33.1795005697064;
        Wed, 18 Nov 2026 04:41:37 -0800 (PST)
Received: from localhost.localdomain ([2406:5900:1044:110c:e78e:f7f0:2120:34e7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff611630asm12923485ad.17.2026.11.18.04.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:41:36 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/3] usb: gadget: f_tcm: fix infoleak, sleep, and UAF in the BOT completion path
Date: Wed, 18 Nov 2026 21:41:25 +0900
Message-ID: <20261118124125.2428233-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
References: <20261013073328.2936318-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
