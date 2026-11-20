Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186728;
	b=EdJnowQrMgNEe7LPRbjCCUUlwxcHjWeV/4I7/3xEXim1pfyAINk/sXoeesAnovDRi+9O
	 QX1oyBpip15+g69hIrSfM1O2DPJYMJDsNoQCgEdB4viLRoh8TiigeViPjFGhNm227FnJq
	 BHskImxB0x3u/TUbROJ4+AN+Mkewn6KNIarntKRx4kKCrQdWPmiGDQonnPb2wSt4jqCJL
	 C+Ip1JsX1FUWKw3VAzmLKXkdkjyrxhSzfpg0uYIpaBHuqWpuXbYg+duO0xoXXmlktjjlq
	 kUyWAmsGBVsHBxHRrOxLdukOoHGzxjXpng9ZdxIRzdzDEkCsKgPfqHc2MM23FzMguuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=zL5A0eGkln2wQn7P2deJiaTIYw/UCNm9h3t8LovTIes=;
	b=qmF/yKxLDb7HneauVI8HqsbbNEopCoFNYP0sLQ9ON7+u3Vfc9bAjZiB89FXl4x/4sMiA
	 YSdCFoC5AguWUpHeBiwxk38R+sW3nPZnuVi7x7XyeykbWhVtwFYgjto7DkqlK49zDQyPz
	 j4NCNnFuWtct/HNd7C5NpOoMB/5pDeGGiG9IQXnQALlxOZyULTcB9hwz8uha+lTh9qRh3
	 rsE0adYIjHUK5jwOZS+rPYOSFHXWpbsDJefU48CP6QEH34gmCVvltnKFsgugGx5EbvPvs
	 k3ZpH3zroTDJnXoqWCToS+dv0b7Qa7GF0l0NY4f1FvAtfU8CzT1Gr/uO2CFi0p7J+Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HZ+Qx0YM;
	arc=none smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF19460A2613
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF19460A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=HZ+Qx0YM
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2f048476ab9so4764805ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186727; x=1795791527; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zL5A0eGkln2wQn7P2deJiaTIYw/UCNm9h3t8LovTIes=;
        b=HZ+Qx0YMsGEkOku2Gy9Tsb6vA7ezG1H9yta+adBztXheQfytmohGELWuoJ7zJUA3s0
         eQQ69vAV3JcviK5KzDNEgk2OwF82y9suzIsjgJANfzLGGDwkv1xU7t2RZXpHyIzU4cXO
         qUoBsJ7r/kBkeK+6WTQW8TYXov1IXijTwmEXzxEfpk8en1NvgbzLl9mU9bVF298gaE7j
         8mI+RH8eF4tk0csovR2K5uZ4PG2J4LJlflsjrdajvN/97EkgEX0rCFkdTW4kWuibNLf0
         OIEIPWCrgYh/z6NhgJrd9uMnoQYKqfiZk4fHLrmoph68JYpKyPqAZ3i63AT3UUF2fVbm
         C18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186727; x=1795791527;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zL5A0eGkln2wQn7P2deJiaTIYw/UCNm9h3t8LovTIes=;
        b=0MLXuKXq/gPQenkDPWagg+C75+MIzWBNYjrlO5OYlJoTJPbGver0pGWbNTKw/WrbdS
         23kt+ptCG20wtp8kTuVq/XTnLYDyGs/KMw/UAZG+FljN1uS00FRs1Wu63Xpa/9aA0JgM
         nxyuOtt1jnhOJ92Wf/y7IpMcmbNQK/PdANsxAKB6cGaX+JfSYyNh3MghwrYPDW/bzDn7
         uRJeedaibxx/Dhgi8iKQSjilISygFH5gJb/unVHPo0MICfH+atlX3ru4zczIN0Uj3wmI
         MzmSb1RrmnVjqR4ex0C0jrq/Ts+MLqzkyN6gFr86snWqpe5ZBLK6V/cgnHbwpU+dtkhU
         PT6A==
X-Forwarded-Encrypted: i=1; AL+hErGk8dTc1BJ9xS5kG6TbV4oUuV9xrQuwRQOAW+DR9NtBiDq4bzT4kuDqVh+M4Gn0h3f71yt+OxJruCrJTNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fpDqWa80yTTx9lhyCPw7MUyZQWQ3/phdeuxSBiy9zOY8mm3Ee
	noh33DKnWlSmv6PeoAcM/ZUrfmlV3QJ1qIOgLDnrV5YE8FRnjDGj5ROneNuL/sb27JPaFhB097k
	tZHBE
X-Gm-Gg: AZFdTZeDHOCDb9dbQKQlbHYpIQbiorzmuYOupcGlyPZ8R/8os6AyfBl59bK0atHwRC2
	s0gzYcF/c42WxxmQUhpN5vDzSrE03wtyEKWDVc/cJ/NwXO7VdgfSnkj+bIIgywxjOKP3ZioJJXG
	Mh5IJUtkTqOGfwIE4gM4O55YF86PpEA8w/MWJzQ7lrKcD8iOKkrs9GyorGFAiPRMWic7MIn6NUA
	HkXi+slJG0/oAZqDhOJZmiAuyQmx9TicqEDZBF71Squw5IWY8DjrWUUTs8P3lKUIGZapWURiBD/
	cGC9V9O8gvGwGDOfbGGDY0JV0yifEEVi69y877LQdXZ+SxiehqOSoHJmz4rd2gLT3RXYdXf3Mrl
	dIf3Tnqs2fwKk7WYOLgbjLohmP4fzaCW+AJFHFAULlFwDG6ScXPt1YNsr96bLwrZeYdjmqSnJ++
	4nk6WcYu9famnC2oEmo68XL0t58OEMKSUXv7SVAfSbzLcoEv3xTI6leZbOeQEkn6b4T2V1X38dz
	wiDqGsvaNyBhDg76S+OKgaECB7dDUyYtMqZ4Kfw/m3xYke3tua4IzWU0ygjwtG3y7vHTAdjFfxD
	kYEA+QdNBbLMGEEwvCdrXI1EwMv/AcNg2ezK9Nh9fgDat8sV8Z2jiwXnvPETiGb/ubTRRbhKKmv
	OSZUEeL5BRmzFBLms39A5VAnZGUDGbc1w/6NM
X-Received: by 2002:a17:903:4b0c:b0:2ed:352d:c619 with SMTP id d9443c01a7336-2f03f16ca83mr34268275ad.46.1795186727194;
        Fri, 20 Nov 2026 06:58:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f1215d7sm15163685ad.65.2026.11.20.06.58.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:58:46 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: martin.petersen@oracle.com
Cc: michael.christie@oracle.com,
	cleech@redhat.com,
	lduncan@suse.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: libiscsi_tcp: check that a read got the data the target claimed
Date: Fri, 20 Nov 2026 23:58:41 +0900
Message-ID: <20261120145841.3127758-1-yhlee@isslab.korea.ac.kr>
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

On Fri, Aug 14, 2026 at 09:14:28PM +0900, Yehyeong Lee wrote:
> A target can finish a read without sending the data.  iscsi_tcp_data_in()
> bounds each Data-In PDU against the command buffer but never adds them up,
> so a completion that declares no underflow is believed and the command
> ends with DID_OK.  The pages keep whatever they held.

This is superseded by v7:
  https://lore.kernel.org/all/20261008063248.767676-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
