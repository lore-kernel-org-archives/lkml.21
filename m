Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795175071;
	b=Ugg+MRF1W51vxYFqnLnG+GPXONltvuK7jJpz7zVDAYrgMDJDTfmozRZ11SEHajopy+Bt
	 yNmjayPuG1mISv42r5Op582OBTjvv+67iscTFJRyvMnhEe/H8AjWC8QaGw6UqGCCY/XnF
	 VL8cBzHc5wEEl9k4rn83tFZdCZ5iwW/il67W0VHyBjnfSvbuV66Onnh+qEDuh3uktqsaI
	 gjKGmexVO/32XAk6AWjQ9B5bOKixH8HbiKqh5JZhFUOCufqdFiJMe+j9cUFLKbc52JmfS
	 XzFi+/k2XLe14kuCA883qkDLjDvNbeL3UgX7Mj/nFpqpBaNVB6H3u5jZBgWsI0EnoiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795175071;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
	b=YECWYKs9+0v4tK+aFj5V5UARM1jtxxtrhTO9hWenoPfCfoOG+jRX5mVQtGFzO1g8YIno
	 l7jbRpyPoriC/B0RqMrSwURtQjRPuoZpq4+jgkenVWxXz8hNWbaAcxWcnofBV/jQ+LXaL
	 s34apMhe4d9EOah6pXN3JoS2oHVH+GlJSfh+C4mF8P97UzlN/c/2Yqzk1X6QAu64HZB53
	 9sjPIjSkdSgksiisVti2tAELJTwdIqZU6A0fovbo9IGWz1aMF1SFvH+mYoNgbTnE0eOvf
	 GPJLAPcj1ZgDgivv+WcKhmabW9aL1gexH/uRAkOFntXiQge/Fm7I9qKxh3KgJCGbEqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WJxAVizL;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822A760A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 822A760A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WJxAVizL
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso615732b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795175071; x=1795779871; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
        b=WJxAVizLYwDKo5UPutscYMgUR8/elpXT2Aj8JtmYF3cjjfdpXMq+C2A54TzX8ACypJ
         Ff/Fzdh8KMGbm4aOONQzmjJqEihV5jFKpsGSFPvgaSdFeqfkMQ6YqCdZ9PtOyPtuEMu9
         G+r7LgvcTgPYsy++svXq5AIcMDqKPvPi9B2xqmpWy7RQqIp6EkwjNdavApPS55iKD0UP
         V0Laord20XXgbrknfNgBFb4PPPVIaWQq0DGvArk2frrN48HpFOTjTrloB4sUhEdQS0Kt
         hTSvVdTQ97ib1nhx9ynd7eJFjczSwXfBvN5K/jjDKsfELopeTxfNrhF7ZAxC5zlXKnon
         /ZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795175071; x=1795779871;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g6MTsOqU3k//pwl7FRMf2NFcyBzVHK48odAYYtmSl8k=;
        b=oyqhafj7CtxB80P7k8XEBDN3UuxevsIwhOM9n4ajR5N4VWDP4eynHFbkdzta3hCsRo
         muYilos6oM6PPQl98uza/Zpd+wm8gtHoc0aOAgsaTvSuLO4Ljf310pEquXDXTARiSPHt
         2RyBZsPvI+djtmTyBSk8yvOEZWMvF0wxIyOs7hB1BZqBO6LaNEDezphkhOPEoUTs5vWi
         vPAR7A1n9JHZVPRZrLT8xrg8eF9RzB9NP/6/KRU+SPQWjN2TyN09cDlhGpF82JpnkVxU
         cU93f4rZytmeSEm4SW+bLx7n7p0GCbU1LnyT9QKmmlMSumDPL5aRS0aeX+fGD1OI4pU0
         HOnw==
X-Forwarded-Encrypted: i=1; AL+hErHQ0k6eZxCKGYwhe4eh6IFiYjmUl6clSm8BHPZtjQjBp6lv66idOdJETk6J9sYkVgrFihg4A0pOyhI1QaA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ODJYB+92psNfrfkwTXX/3nQfDTxA4ctL0hhwc6GnUjEplfFty
	Gcjv4WIqqkLhACC7eJkVN+EXKJH55fALD4jkYTZyRt3o1EowfGdR6FgVGHxJ09FJRso=
X-Gm-Gg: AZFdTZea6kuYbwObyCbFb0ZxcxiHPdjksRel4XgGOQUsHaGgoEUu5m+KQe7Owo1NNGG
	KuOzUKd1PYrT9qhVM+V/dRsu2Tg4tldoYrgXlUC7VUAAiYEy5YqnnepWkDYZiHa5NTNDmvnejbV
	uj9XV0VRwgJECR8BHOn0biSvNiocweQZXqAy7fjPDeMlimR9gNQrvcX6YfJ0cxV0jPCVEyMtPWj
	d/ZxR/DpyXU0OGDGYI2XYSWhytf7iRiWGYplhTZNfx5VafIG+8LoSYMZptHWN+R/mourDKeMMEK
	Nsw9q47JdQW9uMeFRYWLPjdCXi4DL8Wfz4pHcqhp5XM/fGXf/Eb6xkps17HVJBpd0kRjy2BkYow
	m6lvzV2UJ9LS6LbIvjGv7ATvRDNpOx1OXDdfe4WFUJ/q83UPCt2lcMkWNej2zbUlzXKKKnUnrsW
	dou5YBZAeOKKbmfyIPfSxsa+BVqnrbRsW/sJNIfMgx8QxDFOPygnWcFqCAoMYpkE2IVYCABejyG
	bhFSgPqdy9o1GPOh+NTnUS51O4HG1jH+tJ6yiTOJt+jztp0vOyFTjBg/l41ytvWFx/lj5l9ZnzK
	W7ShKylWMUTKseficF2O3IhdQbDHUrh/ZFyUrJelzgMYunH3x7rPoHLBO+qsYU6J8h16afwf7cV
	ReYkemOcLxhnPQiy0qCZEMkLay1g/CHjDhXtL
X-Received: by 2002:a05:6a00:2987:b0:8b6:3e44:8aaf with SMTP id d2e1a72fcca58-8c87b4ee9c0mr2587050b3a.20.1795175070856;
        Fri, 20 Nov 2026 03:44:30 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm1443486b3a.36.2026.11.20.03.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:44:30 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: mkp@kernel.org
Cc: James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: bfa: bound the RSCN event list by the received frame length
Date: Fri, 20 Nov 2026 20:44:26 +0900
Message-ID: <20261120114426.3072602-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v5:
  https://lore.kernel.org/all/20261016155441.1607196-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
