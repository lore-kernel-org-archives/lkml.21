Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174940;
	b=m+r5pFGuqRUyORDf6gnBmUQzMkcbH0XLvv17R6bxQAOxpMLkehoXe8D5DF9jI08jGbLw
	 uly9fq+8Yb0Tu5Q3Ss8eV3o9rNtuMiFVprjqI0WrfH4vZKR8Ac/QEbay4bOKrS8klt+VI
	 liC9bL7FBGCbdCdI22Sse/IAQriErxWuc9gWFNjxR5uiQt/zJ50aUsnAdnPbPEWmMzCM8
	 DlAUZk1/bupQ+GCsVNlCVJJ4CNrScPtugoRTLs5Q4CsH/VZUYo1xIm275Tewnwan1U0sf
	 xegMrL0Xz0p+nwoNSbeRAl9lwkf8Sbig0kI6WHPy+mEQy4B15iAaDBZsps+LuyvFKGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
	b=Qo9+5zI1IQY3TFKQfkVTCzxyjapmtEFthSqjM7ZZTbjXar4hLZ9wxhrWPD7pbe6eAi7y
	 dXOqXt37MAoRzpoLi17jm8PpkVsMsIliO+LfBzG88b6twgMRoKu0kltWLUTLqYAbxrZGr
	 IiNzT+8gxsIzihr7TaW2R0TVTNRK+jjoklY4Y4hioglTHUB219OtU2lG9dtsGzi2ssfn/
	 Ea+xVRQVfHsSDd2/LQAVaKAl3c8vNHTxdooXoXxu05RJySfZjbev5GOyyfKLVTldzncDZ
	 +JwFM1FNXH89/YjktQeTZtWd7HYZ6bVDILAtsbHHN+QmgiPDceJJyM5xyQgUmTsg1Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BF4CQWKf;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3AF606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A3AF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=BF4CQWKf
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so469082a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174940; x=1795779740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=BF4CQWKfllG2NN3Fwaxi9GtepK9l5O2yFjO5umyljvitcuxCX5XaEBKGdxA5iVZnoY
         qCz60f3tOEOnfPMnw5JY1JG/AVpOxw76pfgwYQj18wF4BTN6I5OeK9/fYwO2yT6Zaggf
         9CfiN4V88xPUS0KXz/Rut6EK/Wuzn+PBa/aPAj4jjE+HNizoiWVAQKrOj9S6MUwtxi5b
         EoQY3EybbQAZ2TpvWYVp+GF6as2hwfgiOHFrT5QXd11ZIViQTJhlAcuXrwGC6EHHZ8YN
         sa29KToNiM124U8Xk0RL0UAPSFTuz3ceD1JJlUt3IOdYxcQqV2kNrKMtHKEse384Ur5V
         LMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174940; x=1795779740;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=YYO0+seZfwQD990lfwEqiPCJMG8xLcZlKKs7Sw5iAdcO+1dp4JHWbaeQ0uTw3UYhkf
         LCor6tbUWc4WROSlD+C15dTfyiiuWc8tj5oFPV7b83KYWvWQAfeZ2RxIXmU0EkKJpCDu
         ukdI9qKOOMkFcQ/CiMBsS+Jvhe17RN+uX2nZStjh84Pi/vpHoqx7a7V8Bxx4JMk2p/wc
         3zoDdsHqbm22mLPRIiB/wgrqbTdntyCdpJg4MVxjAywVJXPsDQhjNHBlGUVoShi5KFWj
         zQhPA45/CCQQBoh27lg2vgRFnb+D1s8ZL/nIJWRnyU5HXyeVZxG4LCepmEdlG0loZaiO
         t2/g==
X-Forwarded-Encrypted: i=1; AL+hErEL6G8xnYtd++lfcMm7UlsxY9t396iMve9Xcvippcya0H2kNulKk/OyxHRBPAsH696cHjxkQOntlWrJFq8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h76NK0U5GGtwXigA/1rxEwfu1qrGcTYEz5HJcXyBECE7fFGbm
	d7Rnn21hB0XF/mNO6CxLGlnrlWGzCA9F1bTnny01Hqh1msNr6LSgHupoDJdyew7/mNQ=
X-Gm-Gg: AZFdTZePFWNm54WwY6nIFdHptEB1qEerSZJE70syIfXiMhmIqrIQDVe1NusA5L8lBPO
	Be7nGkL+ptn7LvUrvQVJoYH6QwKauqA/LMrK3R94OzKwbkL2oOOkTawT7keEvdT8o8pfL+olqWF
	OQSEOV2/3GRdaKf8x2n5AuwMyKCvN9syz+F3wiz4YEbBNm8yenRut5uq2NKmsPnguayl5qq39tm
	dKzD+Qeu1kR5+sFZcdw5n9uk+M8FrkldxOqEWOODNfgJ/7S/bXJ//fNQTD7duXRnMAzM0qPvwz0
	+FTfzzbRLgEI7JKCpzWmqI4/sX3cUF7K357PkRw7RAwuAIw4R7UjfA2Hug6/6otQ8IjSzv5H1yf
	mE9eVThLbt0SADKMZnvVM5UApKL+/fEgtV8qxxE14ze4E1s9bubhVvWyWbrTB7n3qIKUhqQwPI/
	Dq5Yh6DynTp9L49z8G+OdsQJsH7SeMmL83HtK3MCij3eEZgBn3MyJh+XZyjdxBuxyZjp81ACMI6
	s7BuTNJH0HB8ZMRds47HI3MY5Cj213ihR4gwa+5TfbcYhhul16Xk17Cem2PLaBo7fxsIaKoKK8A
	c2/UBCiZ22oteGZdVVULYXHl7EAhyezKUzeFmybN3c3WD7G5FCbIJtGXLWr1kOdl1u26geWSoie
	+rqT2RgV1agPqXzX/IUabadEtHfMqBeq6sD5d0A==
X-Received: by 2002:a17:90b:39a7:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b41c9638b9mr2307114a91.40.1795174939658;
        Fri, 20 Nov 2026 03:42:19 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm7162669a91.15.2026.11.20.03.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:19 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: martin.petersen@oracle.com
Cc: michael.christie@oracle.com,
	cleech@redhat.com,
	lduncan@suse.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 20:42:14 +0900
Message-ID: <20261120114214.3072124-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260814121428.359541-1-yhlee@isslab.korea.ac.kr>
References: <20260814121428.359541-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
