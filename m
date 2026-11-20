Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174935;
	b=ZbR5033Vg6FzXjfD1miIlxcbrcoFwTf++yuamiZQn63e7v5OWC/QO5mjSY4MWwnguBF3
	 EzzIzPlveGG3CRCengQcmsSNWSp84H6krBUlQCF6fC/YMqUORuuxZAdYhvceG9YeLo8NL
	 qdH5RrwnU4AXhSqTUwMFA7Q8QF+HdFKacdtjOY3DN2F2NamoN6i+WWMbAEAjB1S7fjTs7
	 1TmRgwU6cHtEXe2qoa2IaAFYALgAZ8OpohgmmiviA1KQRujV/xG8Osyt0Tsy9z2jfSVSx
	 73tkBJTpxKGTgUBQRRhrart95odpIRuqrJnq/wnjXbe9cWbydTuaaglfELwHsJbbhWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=p4UdC3jB35AUdbv2e6iqz1BWlhdEhYwpd/LGSbiSPto=;
	b=vCgQ01gWOFLa1sQECxRLwaaql3B+52Obf6Q8ZUJ2S+h8PUejltlclaQys1ElFVCE6N88
	 MubevXhX2i0UIy+I6K/5+kmOutsaCR5E54wFJA9vPjc4L1md6U4k6COQWhpwEETVM6cso
	 lLUSWysz6SdmSQfyA4EOOdSb5qWWJSr/gQz2d+OGrRw3gBJoW54+KJQhJfXHgsoVVrmzN
	 5aDxzDnGHXcl5oNsH6BN4vfV6KGCP/ciRyT2fhqoH2QVMuT3730it5OT4xR7xPKpWdTYC
	 48QfLDS6MP39/4UJ4ea/2gy/SnJaVZdQ4Shf1kZZTnFIQC6fk+Dg6IUgjhmpuuKAp8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q0EPZbJj;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47E6606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47E6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=q0EPZbJj
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc147d86bebso451532a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174934; x=1795779734; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p4UdC3jB35AUdbv2e6iqz1BWlhdEhYwpd/LGSbiSPto=;
        b=q0EPZbJjt+GMdN0GULFcmOIJOxL7/rNjEiw36j/wq4gouA/cRJtwM8Ueaq43GdKqYO
         +tRlzWt/jkkvOFKI6jPn3IqzIdCB/Y1GOqV5TR/YznbrA++0viMvM8Sq6TB2t1dO0BaY
         Y1F1/H9Yplf45Y/MO3H1DeByqScsJ5J2MwJ46u5M2mS8X3XuJGE+PnaouCN4lpL+w6I6
         YVXIXSNUBYMg4qjzryelmsQclKurwinnB6OtloSXT1LyUQ8IIJ1Wgbj6v/1QblV9yqXH
         NRPbHHhOc/vTJCwQPwycOmN+64HM5TOMnNk4XvYXRPjrYEbcOtBwY1U3mmDGQsGZ6pqp
         RXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174934; x=1795779734;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4UdC3jB35AUdbv2e6iqz1BWlhdEhYwpd/LGSbiSPto=;
        b=cEGPmLdZVOJ+I6cA61dXd3PlAc/WQDmPD9pkM/Rjm4axwvFK+u9URdVaNZMf2ih9WI
         IH8nlUPpTaUZBurF4OpHFETod4KhgGJkvIDv8yld47oDoEKlOK9JA5kQujVtf7Ih/92E
         BT5Qq5Ucmsa3ghzKxW4eEsMUqZtracnhKv6vno5jeuO3zteE191UQivXiopp7SgHHrJn
         QJyWjFoEmqhOPrMyq6EtLwWEXKKotdVS3d8NrO23JiEGjMunoo1GCjPOEEdKyCcHwYf0
         wzCxYFzlM9Bhm6VL7Dh631cdGdiA9bx88j51/SV7ECHivkgSRmWxpTp+AII4sZh7WwII
         7MKA==
X-Forwarded-Encrypted: i=1; AL+hErEkCDjPS+uZ9NROZIryZjpN62QV+PSp9+7fgV/ZUSzkFDFdOcjwVX10xXO29Xw2yGeZl0J5YGRdsQJ/tes=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tLf3Wnm/5X35sGI2+T180BmnugqmLI86zfVYjYUE2rOVHPrgo
	3gn8gAbDc+5hxmLGgUXkpyYKe4+wzWIdauy3EOSWw8UiA6ocQkIWapreRCfKjcsQENP5n018ek8
	VFJ/Y
X-Gm-Gg: AZFdTZcJ/HNhKq11nkA1HzKczT8+ZYgWGhL4ac3UuZ0REdSphZpk92zkCHVyvlcb5kl
	k464QmpkewSoGNnAMW+z6zhl8srJL8zmaGaaLLlwjDR8qDzYMRXoLcOrqFmbXql5y1zeIZXFdY0
	nrlPPMjpEpi9D0Xoio8281VQ9b4uSAM3pHC9pU2/OoQCwEkpKviHf+kASuSOyOkBy+3N5bgPY0k
	6g/ZWieqUBgxDSpGngYHnHaqTjaHJN3T51xUc1TcFtUm7OLdant5UdqCsnOAmdrelg9cjkktQxg
	MrDKIU/lIaTAAObCv4XHClRDGpIDzFMaka3/lY7seHglCNz/00bsMDBlYYgPwfRXOr8zJ1i/hlg
	HjX648lwhaNN8mazT537NdRmrDcr4Fod5y1LTzN1uYgwAs0j/Fh1EHgy5xf/HMdmfTylPnWFPVG
	G1GCGH0xq7N3UfmTErBqOxcqNmtUXrfJ1UJbp0v7Zu9xFCvODV45ji8fGBffMiAzz1bkFNUa+ca
	RgB8ynFYCWUGoE2nPqyVajQAItKwRomAtE288gtTblZsygQeQ5gqj9SVe7aaAMORTqWDT58h/jg
	ZWuZjjmHe9aOB43nET9O5sPkpwEVQLP/wB/Am7Yk+PrdlGLKatCeHmPrmUFEwAcIJ0PZvXiKdUr
	k4ZOLaWBbMnihKVsJpmT51Ywne+33Pxl6V4Aj
X-Received: by 2002:a17:90a:dfc3:b0:3ae:6e7d:7fa4 with SMTP id 98e67ed59e1d1-3b40a634979mr3235082a91.50.1795174934087;
        Fri, 20 Nov 2026 03:42:14 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfe9bb9sm1149168a12.12.2026.11.20.03.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:13 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: linux-rdma@vger.kernel.org
Cc: bvanassche@acm.org,
	jgg@ziepe.ca,
	leon@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RDMA/srp: fix use-after-free of a request in srp_destroy_qp()
Date: Fri, 20 Nov 2026 20:42:09 +0900
Message-ID: <20261120114209.3072101-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812190418.200337-1-yhlee@isslab.korea.ac.kr>
References: <20260812190418.200337-1-yhlee@isslab.korea.ac.kr>
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

This is superseded by v2:
  https://lore.kernel.org/all/20260818035229.505098-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
