Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186771;
	b=bTNIiS070nUW38ilbcTXr9wzRkdnSLraI+rJmSRR2LBEywNiw1tLrw5axBzREIrO9ZfE
	 shOYfIkSYZ9gsW4jMhdYNEsqpGx7yIrMjeaVCZphlfTfzFsGNzfGIuXO+rHjUZk3+RjsI
	 GZrXXtqBZQsvFaH43O0yVjk/TzZccK/N5Y8xoTRlUh0+EA4TtXE/sXj1krC+eKd3/le25
	 Adv6Q+8jJTniqTOYfPHjqR/PQorGhn5cMzXRRmeAocBUxDHB6imPab/rxiKcrzZwCuf8S
	 Z/o8EYoMo1nUHfVaF9hhKBdTh+qL3PjXNtd3weTstZhnPWVXSReQFZzvS4ZAee2+P2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186771;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=1/b16XGw9VrdgMUxGBBQFHm82uGKek6X08X7cWdHQvk=;
	b=Ov+qD4QmwBUMaJ0Kga+viPYaLaRXOV/4N1S5uQMToCiNWyT3cGHD9hWQmJaN9JLMiXAP
	 fCMDiCKdmJAZpY1cCydSwzXvcWdQkv4Ejo4F30DsLU6fuRkmYwanpkU0nR7I7S6kW7TxF
	 9LtyxMtVIukemLyeIlFqFmGaSkgYizJkMgF0LrNynJfTCH7Koo2zx6/C6SwHUWnheceLt
	 k0ZbV2CAzeagax8ZOjkQX0PXM41otqxRaYLsrwlR/0n1LcAZIQ1l14otaCA3X/IV7q7Gy
	 7bIUkUhaPQ52uyUIhL8KszDphd90/iF2WRc+7TCHWxasXjxXA3crKiHvO7jTL2+eL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lv9jhbvi;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB31960A3818
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB31960A3818
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Lv9jhbvi
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f052ae3c86so1842905ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186770; x=1795791570; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1/b16XGw9VrdgMUxGBBQFHm82uGKek6X08X7cWdHQvk=;
        b=Lv9jhbviCyWj5GwiJkQqnA2imalbM0Ak5DPvEtHey9jVkb/YeLossxhZ//waEK2KCo
         Lt4eR6x+TuZ4SuieYKocXIvNU2JDD3XkCTWEcx7HAKNhdEfj+IZSNPC4Mw+hPZkEOA5O
         RhC9sPmXG4XQlovwVthoY1rSbNdJxveFyYh+8ml/QLK78bZ5a9Uw5u73iN7YsD2BATzg
         UJ38spjs6zWCVH9urVctFri9HhMdr8/JejOVf196JTW0XscBsubYwYi/XniPEhrquAb1
         9gYVLdFF5wnB/SFZ57sEbnE7GLofUvJTDqvfvov2yQDPDrGIKX9S5O73ODaa26dtGtm8
         xzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186770; x=1795791570;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/b16XGw9VrdgMUxGBBQFHm82uGKek6X08X7cWdHQvk=;
        b=uftUX1jsYwU75XaHj2qXez+tQH7Ra5wHvN9UNxqjxudvOO9JokBFJ/FKCceGiah+1j
         Zte7WT4RhNyrtRbo3m7bGPdMDOa9sjw+eD7aE1sOs3ywCJ7Y4TsdTMVRiHF+/RRQyHUu
         wMbFDRlu44MIb6UzZEPn3p+K3HF//fy/cNSqzQF+nawLRRaaRBsMOFhHHiF3Y6y5HSsF
         U2tlZX0q0su0WP77QfPXHHt5bFT2Phf/cjdCSZ4+VcxGvB1BQOdPLOTd5NWhO2zV2YTA
         G0vSNZQLIaz0WeoE/xGr0eT8u8fviuoI6BFRwGZGJf15MV5dcver6KK4cyF+QEekg8j6
         wBxg==
X-Forwarded-Encrypted: i=1; AL+hErEl24qiNy/V82yZ4EChM2mlNtBSsF8OYCTJ5NrE5jSsdVJCyt+EJMcWfl5pzFhEjtpXnTL0M3i/+dHJmFY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uqU6lMKJzVirv4vDLteterHNIC5FRZTxtWQlloidn8NvgUDVw
	cqrLjy6WP0+0+OXeqA9F/4UxgQGEXdiw82oPs1UMSatcb3lPaFenlkzZhrFmcx5gYBU=
X-Gm-Gg: AZFdTZeaJfVhp9kacFiVcyAJJm/RAoyoH6wuNzF6H7Wm2Gwwbxs38kL0CKoyFxpHR0S
	uJplSJcKy/XKaH/K6JBBi221GfIwoKcdM4pWTzIY++gI7iLcL8f5XWx73D/jtLWRM21MWQfC0Vx
	czVVP464yhINB6sEsUBxk8m7tXOHYmI/d9SzSu+yLMS+b+diyHHlRy60gJzdO5Tztvbj1tkwQAm
	UBbvhWf4WJ63SJDoTX4imflmq0tnGOn7xZWouTIhu1+SDTdZgmmu3jYn9aU3oPyJLZhrR8lZX+U
	Pkxgz3ItiQglHEV3gt+8BhNgu8VY8ecB744Hj6fdJGtwkn576+6ZEkAqkfHLT5psYRxrV60Or3L
	4odi16n5bucrVehkvZxah79y44U53PY8uia0n1vBrhsPFTvJGIriJeIXlrWrZIEkzHhe3Gbonqd
	6SFS7QIF3LjnU/1EqkUKMyV+VsFMNdHURBqNYN+i1bR630E33ysrlHDJ6gFImQY5FeryIa0CyL0
	coX51dV+xfCC2MQxM3KHIWPxZLKcu3ohMTp5yoqWLdZ8/bu+ymRH3l1J2ngFIXnLHStYG8Y+fpf
	Mc4Vvn0vKSJyjDVKyT/NjSltije6+2tOh6UOBig8ZCWPX4x4xg0+r++DX6QXeextOHDA47u8FNb
	JbLSgLHTdojE3TtztzbnjVRKsDlMTNWuNJ91y
X-Received: by 2002:a17:903:46c8:b0:2ef:ced7:9ff4 with SMTP id d9443c01a7336-2f03f1913cbmr36928675ad.31.1795186770125;
        Fri, 20 Nov 2026 06:59:30 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm15445405ad.21.2026.11.20.06.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:59:29 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com
Cc: mrangankar@marvell.com,
	GR-QLogic-Storage-Upstream@marvell.com,
	James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-scsi@vger.kernel.org,
	michael.christie@oracle.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] scsi: qla4xxx: bound and correct the ISP83xx reset template
Date: Fri, 20 Nov 2026 23:59:24 +0900
Message-ID: <20261120145924.3127899-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
References: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
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

On Sun, Oct 11, 2026 at 01:02:55PM +0900, Yehyeong Lee wrote:
> v1 bounded the ISP83xx reset template read and walk. The review of that
> patch raised two further problems, fixed here as a short series.

This is superseded by v3:
  https://lore.kernel.org/all/20261011144752.2063334-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
