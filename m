Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186863;
	b=afzpqy3RTz+t7CRDky4myOwW2B9h5WdQgHCOo3M6Ankksg3cHG8EWolR9km3jr1I0ATM
	 9QuN8FemMRXWg8auhu3b8WI5l3fEQAOh0WdXI7gfFn6omOnlm8t+huro2+YC+t22Qt9P4
	 iMOXgAeWinFWV/M9mP5A981Syz6SWS/JTt6A8M/Qn3Pk/GjujHw33kzSNw0qF+Krq9vUs
	 RvQrshh1goppDmFKHJ7gIZO9ZEOvhax0q5lwZxy7x9iOhgK9VpbB8nlQJtGc6TGAc9B7L
	 noxjR1XFRCAkT/5YcAVqOEo4j7AoGEGUr2q9CwlympJqVt2o3y2fDJdlRxdIERUkAOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Gzq6a6gkghfYBMHBo7rUmEzdIfmyBieLV65dMGxy5kY=;
	b=BfCRAKqkaNUYk+XFUE6akA6++4qsoAFykYaR5sSWbJWBFN72uLaxl5lwss/b4wQ7X45Y
	 6hyRelRkkGns/XJIF/L/QBuGS0pnC+NzAGyZz+40Sadp8jPWB9YM9RLXbxIU9w0Y6KoLf
	 QadDM7wRl+UOsvjp3puG6d3bIb1S+IX/OT8+SNa7zXduaij8X5zK1aunudtM9XiIX1rtV
	 sZpeScuoF2yLNdagrx1ud6dAQgMf85xDbpevwfVhOeLPagjcbU5MSzzue719PO2YMuvyP
	 3X6l+XyAHEcrXcDahRcaM40reOJMliyXzm4WRgD3yEZD6UpHBKTpP1FP5HR87Xf/EXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DwdRcjh0;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FFC60A383F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6FFC60A383F
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DwdRcjh0
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8b29b83fdf1so545006b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186862; x=1795791662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gzq6a6gkghfYBMHBo7rUmEzdIfmyBieLV65dMGxy5kY=;
        b=DwdRcjh0rc0O73BpFcCwSUppO2EN35m+nDgRvOu3HbneOBWbsfJtbestzIIb/6jJmU
         rdFYQkgzEd83DBxoHFsoeQ0aY5hsd3hXeaBvE8UrlMGETg67ZZZ5KBJnlyIS7a8C4wQj
         +X1YJ4cpOisAP5xzb4ZY2v2k72xKbgx6OzMWXfdNqHiAWcVasotNGNsRH0sKczXIG8V4
         cPvDf7PKLHuu02RxmpmRhPNTDpR2SkyD8nAb012KF0f5cHwDk7WPxKjEWTkAuJG5+waH
         feR29nnjXi5PF8fWx2VSUTInStzZ+NKBbtayLg5cPRficZUZuQwRdxc6t9a997dZP/Ow
         SVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186862; x=1795791662;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gzq6a6gkghfYBMHBo7rUmEzdIfmyBieLV65dMGxy5kY=;
        b=Csz057FLKFYet20QChl9VxW3s0uKzLlwyBWH+pP2LSZbMkotbGKxA0f8TG0X0/IUnC
         A4YxtqG+NEOk7Y5agAqo4rVil0kPtoPKzNJutvn25px5hSKv4LelKV8Sy5idViqZgUPt
         /JPBcDHKcaiGvRuK7l9LYDmsTIJbSbDFYvHhiIDTN/cgy4h6GBI/R+KxB5k5rt1stUVR
         1gVSAvYGGVhYDUdAlTlVtmH6oXcmV3sHF6UgzGB2tzSwH7kxsXEO/6bqIHcrUDXgu3iT
         JiyFw71zcBN2EyLa4R4te/nnTbdU99GyiBqvEM8PTJJWd9c/RrzGuYdGongyv03bqJnZ
         uNGA==
X-Forwarded-Encrypted: i=1; AL+hErHkoLURAv1qgkvTcjrgSuPBeB/rYIO0fXPY2ica4ZbfxqYSX4lJec7VQpZZ+u8cLj85VfJHuGyYG77rlQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XndelMEAOq2lCmIPrv9UdJByaypf6aqfg6qMKAmAXhJhHVimp
	LuzP5TQLGCgxEbNNgNJufJ7zYJb6adyABiTUxZCtKYQFvaBTcesI5vHz1ABaE9pc9E8=
X-Gm-Gg: AYBFou3V3hlbfRhJWMl/n9Vkw1keKn7BV/86LCcnF3we1b5oiTdO/jE4mPaUfxJM5RV
	CA73CZR6TY08p4F4OoXXpNuWNkMr622nmDSCe87ExQ/TXmcGik//1IMK3hmGxX4E6iohiMyXRev
	gPLOcg9z1m2Wm4zOwXycD5spGqUEtigveMGMaGXWPH6YWjLFA+4c53U7Ekw1HmtPpQI9UO+ArRK
	W/sJNRxxSW9jqo6fzgwB1D4A0fWqAXeSgIpRtv7rL01Oz23SFrhxrafd1swBjIct9ckw8xgSyar
	TYSmHx3HTl4EErlD8/CL+FA0sxWeA1PmN7r0rRsdzrrK/VoPuE5kQsm9Yt7yg9j83abIXfaAKKp
	g3KXAF7SbYm3nAVTc3sK2pk8PdKRBn1fZpPcPj3woT8FFwfpgOodpKpD8M9cqOoSQHA/MKe6Osi
	sootr2cbedX9QXrgbqo1QVmxkc570626iFCAbO0rvliDixKSI2t5jvioW/2AuZlNf4NDHaTmsCr
	sTHOc083bVRRft2doD353k8xzRP9DnvQBIyMnqgEKVBVK+4Ee4RKRA7H+LH/6ebDPfv7MqQM/K7
	Yo8/Wma8252Uw3lFSn+iM/Cp4ola6Z9B84jaEGa8pUT/H+FOPx6DujiH8yIU+1ddaA35tZvuMN7
	ZMXENR97HPhpurPTf/N8L8SYe4p4MuX8VS3Em
X-Received: by 2002:a05:6a21:3b90:b0:3de:7add:653f with SMTP id adf61e73a8af0-4014d35e683mr3121906637.44.1795186862148;
        Fri, 20 Nov 2026 07:01:02 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfec090sm1499471a12.14.2026.11.20.07.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:01 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: bfa: bound the RSCN event list by the received frame length
Date: Sat, 21 Nov 2026 00:00:57 +0900
Message-ID: <20261120150057.3128275-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016065827.1011210-1-yhlee@isslab.korea.ac.kr>
References: <20261016065827.1011210-1-yhlee@isslab.korea.ac.kr>
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

On Fri, Oct 16, 2026 at 03:58:27PM +0900, Yehyeong Lee wrote:
> bfa_fcs_lport_scn_process_rscn() is given the length of the frame it has
> to parse and never looks at it. The number of events it walks comes only
> from the payload length the peer put in the frame:

This is superseded by v5:
  https://lore.kernel.org/all/20261016155441.1607196-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
