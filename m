Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174953;
	b=2iqOcn8U+LBZw7sYmuvUh2b3HFAAqNo2AVg97ueWPw8lJ74Q947fjUN7sbXLzCems3Sb
	 tHnCJWh6HTqc1KqnYrMWORfhRbiBFM4tEYkeiInLZUVrks3nnG57XvGKEpaGL3zH4Xunx
	 Flbx2wbdoLMo4J2UNDMKHLWVJlzFpAJ92GeK2mLekrHccUaTN/WB3Sx9ggRbDDb6wYBwa
	 E/tSujfVqHjD+Iskym8OacXtMGG8S6im/MyGkc2qnnfbRKn7YpsAIGqAanbdb5XYC9Ena
	 ZX8/+A/YSe/523XONAXSbVKw92cS8uYUv/27bssue0y6IZgyka08az7r2HlPSfchAhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
	b=S/ip6jrdZEZSyywUQ7mhabsyrsW7Wj6wNxhJq3panEQK8CdaNifZSGxwtj3XLV4yElPX
	 MgFgFcCXzLtOgRlhSTBcB3E9SRp+DuxBx261ov3D7r0NjpmsK6zoA13nCyGN0sTWQBSpu
	 7TcB16EvkbAOLFwpg3ypdKm/ddR2bZR6h9ufNmpVVxZHq11aXXXZ4TRmb9dsBTJe/ttq5
	 /24it7W/Fo6FQcVy6uNZPziljiJmcTe2GmC6Uutwdswu618VM2npybXxbwNCZSpbAL0Sw
	 8yWYl1mwxFGBXLDPl42MWXtELKTmvoT9sYe9k8Bd8WI6yzvQnPEyfmDEzkcJd7pcSuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jHqvMidl;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F08606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F08606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=jHqvMidl
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e9d7791b00so6881935ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174952; x=1795779752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=jHqvMidlaK1ei4ebUo1atCXLopzzBhE/n5JVGJj0dgjUA9nSbsxIxLDErMXASdeysf
         BwYEUMicV/myp2CVSgzJxq+dKoKD7EBgvGsNo31AHSUdAELLvz15YIWstKTH1KrUsIBz
         eI0daEK50jHdTP75CgYumWhG9eCpAMl1RLJohuQEFQvPd0L/2woBufUO7ocvO7D3wkwW
         cAhY1/hmsQ/264NZ1KugI9IhrNXzz7VTC4RTRVt+bvVVxFs8CErnzy7PkEVo8Eh5TSC3
         Du1Dr4MCA0myx5ccGUwQ9vx9CdqXaZpokDP1I72Cp17yG3h9Q50xeVq6Oi9Jrl+ZZ0uN
         oiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174952; x=1795779752;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=V0I57FVXtvpFocb5+5DdMjKumO7Ki7LEFaqJPza3Ck/9/+A1otj4FtwoADp8H9T/Hr
         DMgkTDRa7/s1MklOsSoyQIiid55T6ODEnUuqKG8eVuxp5XlMafJ/QMtQjNGBYq5rnrUj
         TnlBl0eg9766ChEr6SVtNtoA1xyOO4jYg+XD5E0DHJu1SVmrpX8jPefAI5s9+Q5VLF8o
         AeqpBrNlrnATRshD3hwCCVXYcUG1e5vCcxC3FZaoTpAB57xkmBD0cHZ6lsfikE7hEwBj
         h6bhR6PILCFrK1yu/84fEYroZJxhEmyvZotqB24766NpAyop4TmqHcc1fk/z6SQ0s6NA
         yQCQ==
X-Forwarded-Encrypted: i=1; AL+hErFrTaDjoRDb/DggawIr0JQe+pWMssiWyftKkPKr1oHANmQzw+5NHCzH9CZnrmNy34/ciQNpJiQvcY+VqI4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z/k+n8l7tIACTEjAf9MNmrYzAnsh0bNLsT1IuBhffg7Io6pFK
	U5fI/dccFw+uwerYFaK7Sw5AcJb8hEDDrKksnF8TYBOGvWoE8WO3uyk858YOnvQdNCU=
X-Gm-Gg: AZFdTZeC1c9FYC4u4ZyIL44Mp7IZIGgFojhqurv0KHYYkDa9pRZ+3OrJJQ8s4D+D7Cx
	IN5bihztDTRy31hu0m+zvoVM3n5pJY/x1gRqM7Uvd9u5F9aTLgUtMn0/AUtqpiAGn2qIj3dTP3F
	Cvd/c8/c1zCkRC37487jPIY279z7tb5lX55uLFQX+wR5xxq5FgIp9MkPuqZYpDrZvm5fnKf3NlN
	HF8STsO9xLR8B6jRfJ4XiDKIIL+iTD3qbEoFwpWw9fQ8slCHkuf+JNYPUEmGyxO4rGRpHKJ+L8A
	0RVTYU+y1G8NFlFcXycELxZmvK6kQD4H1PnkPp4M+Vx6S6QZtRLk6pHkMN3+JxNJRLrhN8iZBwp
	oFXbXemWYjMXrlNMi43tHkYi9GKYkkxv2jqtWgqqQpMhf8EeTF19woy8V+S0fFV9cULaJkFI40I
	PocYNK8Mt+vRixgplFfc6nnaFxfTBocaf25Cd4qo2LQnHpPJ3dw/hkOvNBBK97cdU3Ru7ypLvjV
	tpawgxC6tFAQnxviF0igZcXO1xKLjUxRTevoR1KddB/xrA7SqQCSDrP+X6RqOPY8DFEQuypF/PQ
	1bf1AlH28q4CXNxLmoNHcCajyoiKlOJCEGcwYpqw+5BI0eyWH7y48NLIw+mbWSckA5TIIJhOx7C
	6glJ1m8hvhlUbVK8QvHMnwk1Y5xPua7PsUmSX
X-Received: by 2002:a17:902:db08:b0:2f0:3e48:8cdd with SMTP id d9443c01a7336-2f03f16acc0mr29050645ad.46.1795174952262;
        Fri, 20 Nov 2026 03:42:32 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0dcbe3sm13292325ad.28.2026.11.20.03.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:31 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 20:42:26 +0900
Message-ID: <20261120114226.3072154-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007044204.650687-1-yhlee@isslab.korea.ac.kr>
References: <20261007044204.650687-1-yhlee@isslab.korea.ac.kr>
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
