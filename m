Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174946;
	b=JYeo+O19IvPmLRH1eByke4KgzqqhiCrvfHECyNoZL1JZ6EvSWa/OUATaYaojb8cMO+q6
	 tDUkp2da3o3/3SOuOGExTNQtdayMbYZ+0mdYt43dTKiulW/D4BlEN4lm1VdUfmXmPp1Di
	 FeeKH9pd5APZzfyCMnjxmLBbWOZlJDXTzaQN2hrcYx0myfoZg8BJERQOlNTfpltZkgWMc
	 0R+ECKw2I3NDhN7U/VR0yru9EtXVMNUXdgL0vuhns/6kMptypmo3F4rdQtyh99PgSV3DC
	 GGVF+m7WHwujVpYG0thbc5nhHMwG+CoxdJgrKPpY3Uewn7GQflPqPQDgk8RnYZs+dog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
	b=SLFQwbHgKrOsNqK5mfW6KgyZqPSVCDdG5xBcUpS/UE1drT+fGkJ03pfEtx0ogXW2CF8B
	 bTzWurceu6SdLgfmwuhXW2U1HBePpd9Run/ZMJty7Kor/EyZ5OgcFmx04apCcGYCPvDvg
	 GfbOglyXVTptA4Ix1jARHtsVAePHLeBUtKpJtQSBX1BRizG5nwi9KHYPI9mjE+3apM3Yp
	 5yQM70IQpv/qrXEJYCaa9h1a3a9Z0fjfiZ0yHi45fR8eKWCAamAciesey+f0eKnpPImfA
	 jKDhFOSfmblakbMunS+HoO1VptEscU7x7ZUGquEaQHwGhAEMNCTKNU5jNIUqzZinl9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qnc3ovur;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7663A606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7663A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Qnc3ovur
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2f037bc348dso6839965ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174946; x=1795779746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=Qnc3ovur2XzIyk91JOuf4a9IFGgaBu89uCIW78Zz8dXebNk+k4gvcFpSUeRSxBKil0
         1hxBAoUBA9rQSxY9iU9BftiIKlavOxTMEPsh9ry0f5u3gPbiy2/HEIMxfZXSwGd/Nsw7
         woVTcMoufsTydKmheTN6n+xhboCjh4eqalJEtyB2YcsBmIow2d9TZSZerajcGJoS2tPr
         5Eeg7T6r9Uhj4w6vsCJYyY/QYusGkqMX8i180+0jzZ+XVaj/9sA1GP0USw7R+jqWZlCE
         5LA258rfH2T47oMz6BdFlEnQY0TiNoJiY9owEs6jlayfJYfMPIatSFQPcS3zTm7pI/+d
         0qtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174946; x=1795779746;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=eyGTwwq/3Wp7Cm53RaPEqZwK59PVEA2JIAIGBpP7p4kBeV9F6QDKgAh581nhRTuWaJ
         N3qs26hFS7kyMCb8ysk/9+uKLclqt9EqB1I5wzK+DAG/tTkLLDV4QpW4q6G9T3rC74Yq
         7NRJ+SD+AhsNA20SU4+E9NS73afS9R5WncSR6nIQ+LY9UiGAjZX2ONiIyN9fgnf6eu9f
         pE/0k7BK/vWQAOOoFBfIrSWsjsmG7AZ//HBTPGQpyf15W5wwxZ+PbyO/CCMLObyXu9LX
         zBxMwddKOEvLMaW0wXAuUFkbv+9xE2cufr8wqgmBxtDhkjN7VgGlRcI8CVO3cY9FE2hz
         stiA==
X-Forwarded-Encrypted: i=1; AL+hErGvMNWZSQxLgZ6jg2SiitKdqbMYRWUdimGu9hy9IapaUV94QBLSedzcTCVkglsZZfkVWhURHp/8rN84m04=@vger.kernel.org
X-Gm-Message-State: APuU4Z+lRIx6v740jtO45UNYlw9vt6gX4VZkjB2G1tJyhAI0Sk2FUSTn
	kqnAJrFEDA+HCtHQbtopOptO7Ap2xeNjuo9c3r9NTQERun22NwDPUfV1whVvDOl6qrg=
X-Gm-Gg: AZFdTZfG9VIeDJTelIgHjqerxUVVFOl3pmaJ9JCJE2uuhNIXoA2NP5Alv4UTYEWuSwa
	0Nkp7I9Iy8T1yjVZybfEy0dC3PL67YxD5F+e3LeLhlTm+S3wJvVvw2DBOLCgpDTllyjSulp5juT
	YHDzR724e1/LgI1aOdPx4Pm7hgKk3bK9yPmRjjMgh4psSUXzmwr/slxh/N7B/uC77wSpfhkUQlR
	YbmqOTw6g2qRdoAIekVUpP2fZSQPnE9xtSmPVhTO32JL7b9MF9s8+rapurmiv4PQiimeYsUkUCC
	xueukvPVXk/nTBq2gftrkP8Y2+oJ3+TMoSxHFjqimgkYmsIWryrywS10KK2fYtBy61hJw+7HNkM
	XuK2qTt7vnaph1UexZ4VkiCbWW00JCE8nU2G6rNsXXCoKaLG9Pw3oOKzAezIjJrzd+LoMVRBds4
	76+hmTqJh4ggqSCtCn8IcWLXxaA62FhXazL2H8o7ya/UKla13Lid65sQCTWLaxf/bKSRV2dwKI3
	kjmliSebDPDsm/XSk4GE7Xy1IiF3yn6mTJP8nLZ7kCYV+0Sr8NtKkiRhYb3mYIq2O3CZPy9Qq7h
	tqkfknrkzn5SNn2XiVVU1xkSrYLbJJDviTjRU3S90ebivlPmbOepYbkbcHKl3OSAkFoqRjFwGSk
	C/fORQtmT64Q0ntrKrDrD34OjyQ62jELy+UKQ
X-Received: by 2002:a17:90b:4a48:b0:3ac:9d14:fe9f with SMTP id 98e67ed59e1d1-3b41c9032b4mr2584267a91.31.1795174945866;
        Fri, 20 Nov 2026 03:42:25 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0a33fsm4086815a91.6.2026.11.20.03.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:25 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 20:42:20 +0900
Message-ID: <20261120114220.3072138-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007032501.640372-1-yhlee@isslab.korea.ac.kr>
References: <20261007032501.640372-1-yhlee@isslab.korea.ac.kr>
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
