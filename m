Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174965;
	b=S8/pqm0vfUbsT1LoMhBpMsa8F+KgV0z1kMEaMAzyKK/Ge+Grx2QXDUaziR250PYhrL+X
	 c6SejIBuly9/sePKssdksMJGPTWsAmF30NXP6zzxKV32rYNDUQVdCY+k/MKyUlalM44zC
	 pP1Rx5R+GNN00H2GqTrKY8JBL3kwd9JnjmdJiyaShkSXTEwVJ8sJzy5ffxU2WZQd1gC7r
	 Vwn1p1X+6N8ZMIgwRqqWYK9l7CKwyjyvpztL4dZ3DzvtKh/FeMqCE/7iysWKJKMqgZoKF
	 R+XbJejCOSkgf5ZI0OLDHB+7ctPeVP/+MQxpP6rNwf+ltYteTAbU8h8VBGmXA7yUbQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
	b=QEgKak/Ssn6Hk5j+g4XNulSUuWVK+NWJu2lkN047Zakd6Za7fCWF8mQjKB8Ew4Tc+yhC
	 Ug0zrDtNMyVftZORM8t2FXto5DMK/9Yz3n+buQ/ez2an3NXmxhmiDklt3hBSSCizkSoi9
	 Bwxx6u9pTW6VSjuVeloEy4P4VVqnkLU+xwWFz6oTarTubHdrbXk5J9JbGOQPV9auZLnBA
	 FinjpW5BL8hTqS6EeyjkghTV7UHcMnfDgYxnYgDAZvj95eTv2ykDaWuB3VK/nO7ES4Lnl
	 iokKRFtlHj+uBLzB/DThyxiMIX5UnN02AxH908uty+xrl3p4bIjeXODb+RZ4UfFkn3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kNeamzDU;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB75606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CB75606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kNeamzDU
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-89d6bd67045so349364b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174965; x=1795779765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=kNeamzDUU1XYO5AzU/64+NDNni5olDNCAb0Uw96PRYvVvZTyVFOa5fEGis5AvVX+gg
         9/VzKj8YgnbII0NwtM2QicSVUiiBH2MTRzIWFs+Gk0eiG802b3mCuPl6E4zCEUUhcOyM
         PQn3SCIwSGnldj8Au0MKZ++hD/r2P1d58zCJC5reNeYusOaWI9vd2q+pc0qP4VrMyjaM
         yhUYOdpOQt3p7CYSXQtaWaTq7fcEBXPtFnipXh7VZp2m5j6s78cNaMMTXKNON6NHKpY4
         TCQI9m/eHyZvwZo2MA6sDgZKKXOemWXKNM0W/FrL4r2ARKV4TdS1e8/fpihG4w6xH035
         mhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174965; x=1795779765;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zkI23j8MahfPJVW8qMcXMj9oI+W1BwYSEzbCZAbKEE=;
        b=WOdPM6XQDWdwDc1nwrZV6a6WEEzsbLfL6HmabroLYUrnFENcZZwrmKGQK3wQx6fGL0
         epuWQIHVnpp+sOMo4YVZblLAGLJwPz0tNNXPl/tmqGa41uzcseIYw8sl+ZM3sHWlr0r8
         z9hdO6OPdR8k/S0/ZnS30gBhfX5rREwBcguVLpBGiZ2lTngpyyfAbED3iCsWxPUWdEAf
         wz/AkAslFXqhG6OvITQF+FfueAf9llzEnN+fGXChay5c6t50sSRW4vTmqtt+9HuEybGN
         lrkmJskM0lBNa9mZUTH9GaXkjw6SSZfS6z//W/rTXhCGkz/Qpac2MXUB2ofaycELWMBS
         f4fw==
X-Forwarded-Encrypted: i=1; AL+hErF7iW89eWGwV/aKrktzEptN00YTMy/QwwUbu9JzrRIHEWFihicox+LOyEL+re0aW4uFLOq6I7cwZ6x5Sv8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9n0P0StNICzsx5QnZjAXpCRxQvUxHZnQ/hy7wWnSfqtN4n8YQ2
	YZx1z1/QCVLi+fKsF5sfrup6x6brDGBWPCYsZSA55/Uadk4gz5gEPTnzE3flRdsbjYw=
X-Gm-Gg: AZFdTZfojjVj8pH7FXkhOHk4nAtSmN6CCPALoXzYVEqczYnPLlFp+GzcZTvA1XBbQWn
	mnz2dN4qCHD2aUNQFKL/Y/mtr3JHzsvZ9lBAuLN7eHrLb6lpB7tfbEhvsHEaQT4xmPHx8unZewi
	HE6I9kTDxH2zIJ+Lhg0axDbBbc2o6iTLk5ypVB63NglqZ61M/h4Cxe8wUfEdtPighBPbzlHbqiF
	1pGZVoHz6kaExn1dueBkNQwbvpiAe0M7RAkk5CdXHict9edei+xaZE15zWu9hQhLxMek4V/zEif
	2ruXUFOTAuukB/5oD6o6ftmjqeBtaTi8zR2agQP0EgbIBaLoKhuOzjE2jZXft0scGJzTLsUILuP
	E7D+SQ4swzUV4gLQQo57v4taZrNqbk4SdpxGcrK3SYXdHgijEp/XkGu9DhndleSjULweWfgXCLW
	5tS+9+YoERJfyz94SFPKwZozFoyVdG717aR/rcQaIZgefhPJ5AzfMnCObxFQ20IZtn8NQUefTnW
	CvVLr6r88MR7/seklt+Ppa0dL3zRQ0RDny85S+bJuAsX6RUuTxrw8Dgmtsi3DIJz0AL2TqqeUNq
	ZJr1ErTOiRbP18O6/8mM601LGMZmr5grD5aES6R1wp1rnmqHFNTEkeATLoqF3liqtI0ETcVnOed
	NxupYC6M+TCsVJlTv3dfh8F95sSOcVsmgJuu6
X-Received: by 2002:a05:6a00:1794:b0:8b6:2333:54a3 with SMTP id d2e1a72fcca58-8c7de584caamr2966934b3a.39.1795174964688;
        Fri, 20 Nov 2026 03:42:44 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm1415137b3a.18.2026.11.20.03.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:44 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: michael.christie@oracle.com
Cc: martin.petersen@oracle.com,
	lduncan@suse.com,
	cleech@redhat.com,
	James.Bottomley@HansenPartnership.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] scsi: libiscsi_tcp: zero the unsent part of a short read
Date: Fri, 20 Nov 2026 20:42:38 +0900
Message-ID: <20261120114239.3072188-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008040129.747538-1-yhlee@isslab.korea.ac.kr>
References: <20261008040129.747538-1-yhlee@isslab.korea.ac.kr>
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
