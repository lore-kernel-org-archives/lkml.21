Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175050;
	b=UB5U4Y7LND568orG9L8sYCHiPLUYRE1Mxw9J4DO6nsAeNhQnRsgAw8MkLlIqf0nSBZsg
	 IN4Q2IzulRWPXal3hxTX0P/YQcyl9kTCMwtSgvh02N7IKhotdrmNZuKq3LAqeay8ZOO0p
	 qTaCjTAq+k9XPiOnB0Ol1ITYh1PFD35JWu1fxZ8IFBAF0IpBEJd3g2zAq7GEoGnuGeDwn
	 u/vpec8q8hoCqkJzfbnsialuhBtx3gMqEXBbNTSAWXC4wC7qN5b8zJ+OrNL/C9yOiKS17
	 tptdc+kZU09s2YttfSXJZjcqxN6CEaQjaNnXCprVZa9Y7Tmd9zwQdoBDzrCJD4kjufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175050;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
	b=RXTIL8EYUCct9WkGzOeQ4ZtqQbUEr29RAAZ6/KaD8PAL3GhDkcAPxoHnqkXcs1Q1wG0F
	 feOqE32ebNmG2OurH7CWam8SxpCVckJzDxi8HXR1Xne87+8avWJMFzqgkYYTfjpN9aX+E
	 Bg7kaQI9rJKqgjpQHt2rRcqUCr8SwnFXeEz6z93OTcpsmUXMiB/3eEf2Cepg3ea0pZtnf
	 wLlXeX6b2YzegfAfjGYtsKqyKUL2utXYYcKddumhC++LDmRHAxNOYdtQWRtfit8BBwmx2
	 qTyrv3da0BfaC7RSgOU2h4u/LRi8CmXnEkI/j+KeV/I39qQVYYmf6BaUCulzQC82juQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=apf1ii2+;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F38A60A261B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F38A60A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=apf1ii2+
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f02ee04378so6113145ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175049; x=1795779849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=apf1ii2+9gVuNmGIDC/YJL67ctf5NNMuqzUkk3OiiqwBzzmT8b36UiqDl7V+m943vF
         kEKQuDV2wjdt1fSaSuSoFZXgLIVvDat3s0/j0tl5kMP5jqd1x1iiEJJ416InTnaACQo4
         OcsDMp8Ga/HRmiWdIUIU/og2MGe70RbLttrruJi2kM23eRUTXUnElnuNt3BYXyrHbMVL
         Cjfw8cvy3YKeHoxLjYiP6DQwmvWlzBTWrnHgsJ6OJ+iohdinNIvbdMHEoHrioQWpjVWi
         lrXeqy20fMVQ4MlykdB+BEqkBbRxC8+5l4CBPQ3zoTtyFVy3Vts+zHv5QfZdjF+wCsgH
         6xdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175049; x=1795779849;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f40EVFz1rtWKrEF/UhE+GvFPiXhiXKV+B46XullK7uk=;
        b=xZbtKnlv8GtCqIDRiGj0BY8Hl47VmlAgtIHwzM+4Bmvb9A/DQvIhjDFWycTXYLwIRE
         +JcWAFaw+PnVn60q83XvvoPwK78kpj61sN9Ow4rlaNG9/Jugeaejxil+mZ1RVKCXCO3i
         9YmkqaY3bbQj2Cbws9JPxNaS/9qAMFRNNablJson5fgr7pyqAP17I+LFOv/wmzjYo002
         XZx2DHGq/mKsbQ8tOjte2n6WUQw/3itUKpkyfhLi638FUEEZoZGEXGKVnyHugfC0Mvum
         0xJzBbIM8fvcVSs4yh3NnC/ZhfL0uaY8/h/eoSCfzibHwdkuZ0qntnacbsyae8SEt+Tt
         ttzg==
X-Forwarded-Encrypted: i=1; AL+hErHBAQ4AKKoBPz6aLW0ph01xJhyq1KaKXjVLFhNKSTDKihFu1slDKY6cvjaHuAG14BxBEPlv2otwF065qpY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2tgENkzHA5Ep+cykGV53/+8CXV1eSlwKBZgOegiMgsybJZ/A/
	xX1VyeOAKdn2DQZ32KT48u7+2lJGDBkmvGg9HXVUfXEzVntLihyQRUuPDgWO5FJHJBQ=
X-Gm-Gg: AZFdTZcQNAkHC93Spo9rYA6rDuzwwhlUMAs80IvgqK3Am0VlT8ofopf9Kp5L5cksDTP
	U8Cz7YtDmyW2pTAIBIogBCKX5yIZjTH9jTEDfvnhyr/bbMZByKseXWgmnqHAeKOqrhMm6QkgOXY
	56M384LD0ciJOcvOBMtbpPF94TrQmaOaq8hPIz/Z+akTfj9d2ytmZMyv5/TyNxo1RXIGKupkuTN
	gA9zbA0HiRnDUgKjadT3ATHp0K8TnRG3Wp5WMkgAVJxR34Ge6yc2WdejzQd9hujKVonW7xdOCYN
	DuLD/+vNZ5dexQ2QuwH/Nd6lecu+0/0bcTRkWJYfuj0wsMxkcgMs1HOXN67lcG/S3ncwDUpRXLc
	36q3mBqrhTbHVO5Z0sdomMdfnjNdmNzTSRvV6HXTqGSCVgmPPJRRUucwN+ayV8+EuUTcnuIwL7t
	CqHGVOffMNcJspYh0tjI9Cmlssz+V82/tKYWD0N8m0JoACphzN+zuZPLhx65j25HJeQiwgsRjDw
	cVGDrkboKShsjVsauhZaEZcGZBVtmCBRSXbidYF8Pqlni2iXKy30qxO+XXola8a773MVSWyanu6
	q+IbkXBT3LEASI/Zt1CS8rJAGRV3sVD0xQHSMbkHnHI5J8J+oTFpAmEcNSwtImFAz7QIzm4XwcC
	5VOpCjPe5qEwXZZv25OOyuIQVtjkkSwJGzkw3
X-Received: by 2002:a17:902:ea01:b0:2ed:238b:7db8 with SMTP id d9443c01a7336-2f03f26ee21mr29732325ad.61.1795175049207;
        Fri, 20 Nov 2026 03:44:09 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84425sm13850705ad.6.2026.11.20.03.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:08 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] scsi: mvumi: bound the values the firmware supplies
Date: Fri, 20 Nov 2026 20:44:04 +0900
Message-ID: <20261120114404.3072531-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
References: <20261015022728.3936714-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v9:
  https://lore.kernel.org/all/20261015045213.3975845-10-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
