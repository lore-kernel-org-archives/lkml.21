Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186716;
	b=wQkKX3a3SWB402cihpD3N8ORVnltKoin0sKBDOM89jXpXK5dTVHBHY62RJi86/RlDZQ7
	 YHZV+yrq/WmBAnxEP4nMucX8zfWiYOymCz+0htEptFpyqWAcqdmejbhYYUHJ1cM4Kgslu
	 FKoObNc3hqD6NzHnpQ7XYv5i1J0EHZo/F39RYsiQzKBgflEZfnbfnYulGGJQTK1zTgRTh
	 lNPdImW7P2rbAWKzgMq49Wj3TJRoOUb3l7ZN473E2bvN+ITSxGM3+IZBc0iaw/wRdNKOP
	 MJz9HZLrRvYao0Hp4BX81JbuvsO/3MM4Dl96gEkVGQbVVkSziLHKzNGN8VBTEbAKTdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E6G3BuQHqwFY5tfzNRea1k3DGO2evCkbLdAqXG28pQs=;
	b=JbqGc6wDMeuvJPCL1latJwwIaCNZc+pJ1CvLG7toEnp9CzOle6oAHdt6BEvqG8khrdo0
	 vnp/Pyqskto68hZ0ta+NBaUaQPUCB90NnDBuR/YFKNwueTyyxrpr66UyDfLiBhea7PO+g
	 Qk5rtg+Yq1wgxiANjN4tOTLGE6m0t9pqf+gCD2p0SI5svrLvsqKp2395pHMHOlw2Og7fX
	 eAJjANiV4Gi1LczPbpSnNKHMK4s7t3r673NOqxX7cg1wAGBPs40x9Z5zwITKfL8Oa6gJQ
	 3Ibhb+1MfNqYU4qj7FLGwPgyCGotGOzgq2/9GLkFvikVL0sbZtfWQmFI/taI6awak4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d09wDq7X;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3090660A2611
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3090660A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=d09wDq7X
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f041f88577so5799285ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186715; x=1795791515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E6G3BuQHqwFY5tfzNRea1k3DGO2evCkbLdAqXG28pQs=;
        b=d09wDq7Xtf/yPNUSUJC1xtX71TCCcLQmg9nOZHtNRXySR/cTI9/Kjr1fu/DTA3OEo8
         7rFZYbsu/Ym/Ilmxw4l/Alq27fsy2InpNapNukXUJnHw0WRneub2rkK/wqWocYt6i2l8
         dFGn05K1Qh6MMOaor543IAdOKMwtiny4PzbkKeF1wRTJ+k5/tVZDrHzHvatlcO6sQswa
         4LaTt1OK8lbY5nofBw2A7hzMG0ubuqKS0rgOOxNa/3P8SoqfvarR18gdmqGp4cJesL/q
         IONyjPStAgcVuCgPfr3djILCQxsKUlr3wcih3buL4AjfDDmkixXm4TTW+mE1nhk9bXq5
         GEUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186715; x=1795791515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6G3BuQHqwFY5tfzNRea1k3DGO2evCkbLdAqXG28pQs=;
        b=t7eZAnnF6fnWawP1YOo7I3ABz1oAc41kQDN4yRppCHiv1AZtD36ZiE1iaaNweDsn4s
         SNk4X/ZMuOAVchOm7aoPhbiR2q6x2+Z2yQ75i/TEdZuADjVZPninXZoLvKLmFIhNA7ib
         yicoFiBaPzv/MDBUCeQa9wkIKp2sQeIa0wwUW09Tt5MVFKfTNXSxTA+nHyV3z8jmjFql
         Dl4tBTIgT2O44SiV9Fo6yix6AUdjM2Ypk7MpWbaDTaOYZGJhlVn+t93psRqhT10R3l5H
         HhoKWXEtjXIrS81HOLclJD5c9xpXM+2a5FQ2f2u2jMprIVCT1Ta9l3TrLp23QWZQQocQ
         +7Lw==
X-Forwarded-Encrypted: i=1; AL+hErFCIqu3yojL12XZlAooWbi71L9HbkpNjP+QrMH8vxo2hXzwe7gKe9vssmL225LnEzBU7K5JMxsc743kjnM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+n+IXq+DT4g0e0/JDhgUMnB8ZLk1MxMihl8ovB+WgC8pOUXBDL
	ybzP16UaxGkGjz2IsRUpSruLavOCDHHyuKHG3UfBKixymW3PfkZrfbw/wRlqgKuXyDo=
X-Gm-Gg: AZFdTZfsmebeOIcVDnRgI9x62ZW5kDCYU+SwCQv1tav57zkw7nfUXnnAMw3mf+jPGcJ
	J5/Ty2IfHA8mpncNRkJAdL8NopGd/SIxhXUOlLrmM8JatferqGhEn2RWpX15nUmckfBmAMlFxM8
	BZei2jyWVufgvZtPlhwCs4teyaCmmh3E2I33kyAyuwjBEHFbtQ2iXxYeImzFKeqgpGNOruLr1s+
	kt3LD+ceHuUWeGdeOExWAFB6xXGJdHAgjvoKmg2rtmRwLBJ8NUIo0mSSCVpXlr8KLKAJQmqZdpR
	fOUqfOrRYl4/9VcYoK8GcVVb17GGAIMEl1JH21nuCllS8id7P/BJNtSMhB/Q5/NZNZPMSAH3H3w
	NBjMX/162FXjBrkYn+N1tD+hkONHoRSvj+7w0+PBvp4CPTZqynLy1XFvs+rK6BJqOaqsGvgWOjJ
	Ka1KPG0F4NW06aIhbFOPljJFurjTSTAX+tsD+dRIbSG6+b1ofzMqK3Q2bi/DodIN1pa8VJf28Hb
	owEaKk7/7f2g6LaoDvW9MK+mz4JpfUDp5LTNF7rbsPURoeNuvfFfxUorH+tty/XzsErxbJzyjFa
	gau7QMZ4faRf+asagqbv0LouyI1ZgZeRCX2oi4PLZUotByHjo6UcZRHoasOfyz/feQ60Kfxb9tJ
	XfzRN5cjgIxciJhyAAohp+WJRz3FdXBtGB+aBMaYq3DTuM8CxpEUFhpPO3A==
X-Received: by 2002:a17:902:f551:b0:2f0:2ba0:3b9a with SMTP id d9443c01a7336-2f03f1bfc54mr34636435ad.38.1795186715512;
        Fri, 20 Nov 2026 06:58:35 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f10c9casm15616035ad.52.2026.11.20.06.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 06:58:35 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: martin.petersen@oracle.com
Cc: michael.christie@oracle.com,
	himanshu.madhani@oracle.com,
	ddiss@suse.de,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix NULL se_tpg dereference in target_complete()
Date: Fri, 20 Nov 2026 23:58:29 +0900
Message-ID: <20261120145829.3127721-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725084939.694403-1-yhlee@isslab.korea.ac.kr>
References: <20260725084939.694403-1-yhlee@isslab.korea.ac.kr>
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

On Sat, Jul 25, 2026 at 05:49:39PM +0900, Yehyeong Lee wrote:
> Commit a47fa41381a0 ("scsi: target: Fix NULL dereference on XCOPY
> completion") guarded target_complete() against a NULL se_tpg_wwn, which the
> EXTENDED COPY worker hits because its global xcopy_pt_tpg carries no
> se_tpg_wwn.  target_complete() dereferences
> cmd->se_sess->se_tpg->se_tpg_wwn; that fix handled the innermost pointer.

This is superseded by v2:
  https://lore.kernel.org/all/20260725165818.769963-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
