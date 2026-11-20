Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186908;
	b=xfIgwYNqYnD93pymKyinZ4dphYnF7Tv3AeAzgzgL8qg2qXWY77KXZts7DsWl1EHzAgms
	 koHdKyDq0kyoyAgHkBYRigDa44ISn9r70WuPFB+JwH6EjM+cRRHmJOU3W6Ssa9ATViw8n
	 YxpzRONph7XMS3qsf4NY1f92s04L8Wu+GaL+cmnErgclFAj7l13Ubro4MGv7xHmxrnH4m
	 bo1S3GfatIv0HWznVJtolHaZPaMdwuavVzSFj82vxJhrWl9fme/kl8JulvfIfVUVyXknE
	 fi0kqhqfd1BLvhzBRgYLQnDGH4VpwNwD3bkyYaW1NObOWU1egMIiUEUtwmIFfTeK+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186908;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=UeVDu3TiM5Vz6KYQ4zy5qxzuulWda2oFHtHtn3T8jvk=;
	b=wwRWmIdqn7KPi2gRsj1y70dSk/yxb3NvcNQSJdOwHcAMbGeEgANkgJhzxQgIUyP6zlBj
	 70L9G0XaBiOJuZmg/Bsk+LkDFg9B4aDpJfHUjQk8s3SXMaHmJyyYwnVJiKJcDWRQOjBnT
	 E7NR+KtxjGsBwA7FezC+xachU5jJmfWE4CFqkc/x2s6nqBELMDvM5VLHe4p8q9P0GxcGi
	 033MxK9aNHvgW/Nxw0s9WK/KsbXAZSQmBUbF4gPUHzgDtiS/O9BoVS4tGnbLknZQW0/bo
	 0MvGSJ2BZkJX7p+tFHKJ+IIMNG8paH90MkrCDj7ZSKQzw1a/AEUoJYiLjIr8Ltf1HOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LISZnTJy;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59560606A827
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:01:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59560606A827
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=LISZnTJy
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b439e37813so192369a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795186908; x=1795791708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UeVDu3TiM5Vz6KYQ4zy5qxzuulWda2oFHtHtn3T8jvk=;
        b=LISZnTJyqLv3LTB7PkrPUThBJeQR0BHqn7qD9E1Ag9PKjSJtfRbiFz+iBJZzj7yl/Z
         xFogTX96DPjXvEtX6aUrQTNh4WHnrUn/h183GHEuiJ0e7I4LdJwVx+nQaePoov26GafG
         KNc5N4QnmjcaloWXmOKn0b5p6n5AoLSFanJDrN61xFBf+yTBC9wyv+T2pXmL4qh5j2rT
         ecK19Bu+Y18SZepHrGQgR5cah9nhN61Pk82D66CRbZpTvCN1d2f7HWzqyUL2B+hVcHTc
         5w0tA9Tu6DuOg6Z13j5E5t6mP9hbVB/F6Scfb9l6XdKeuYeIcYbkzh/foD2hx5Jhfx81
         cPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186908; x=1795791708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UeVDu3TiM5Vz6KYQ4zy5qxzuulWda2oFHtHtn3T8jvk=;
        b=xhorM4Y4ZVxYZ9KS8x39rZCSKIT7XNajZeuusuKshyciN7TfM77kpq9m2IuAeImaIR
         a/baE7jyF1Sjyt+BL2mJNRKSTc49jpQFN84z7Ugm7nktnytbxQBE4U/yEfsGmdq54AyF
         gzEzaoU3G2/gFA4HCHMKkDOwKxw0JqDa4+sYPeJPmF35/98rcTWkWxNynM1IMDEh56Lu
         3AY4ZzIXX/+Hl3mcdXM2yI1Bahn7a3K2BlIzb6c65/3DZPhj7DxH4rhg02uXF0Uk8xQz
         37jSHijvKDikZIpeIEZydkNobkTKaiWk9Ecfpy3wt/zf07DPidX/s771H4GBAKpfc5+v
         lc8g==
X-Forwarded-Encrypted: i=1; AL+hErFHM91dia3ZssKbdXfx5kJCGK6nehAlQA5uXzSi7CzepBUYiKeKYbJGkULZTGr8VwaUu6jDucwkFyo7QVA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ttwN0ESOPjgyhMWnXOJCb92AXIABm9vOUcDpd59DGwjUfgD+8
	8g1sZsGO4+126dcPkveDbWhMbMR+XYfiTCvp6nNVHjR7+UeKdYmdrYwDdiQfUuQfCi8=
X-Gm-Gg: AZFdTZfgaCSVu33+oYVtj8mAZs5+R4F0SpUh9iEJwHYFtcoGpSE/sbJVBWA3VwhIf6G
	abwa1ZAE0z5Bs7CCU7vqjnJHcBBrcCYZLVB33CSHWcD8JLOlVt//DlrZc+i3tT5aKYREZi5pTcR
	OSGQSnRjdjASkwias31QkomebyzkMJ1SkmAoltopJikKZAq60LRAa7Uk+ZvHvJl51lVsl+7vtEs
	m4vwafPfTf2WqCmrheqrFjanBqMS/SDF5zlIc6NME1ZxrW58Uei3JmPAZf3jKnWK0oFx7cuBf8n
	Y+wTc4WX1smLN86fbshphu6zx66PJl5pTThrhSa77qLb29QI/qhmZW/8a+k9TFlfeWVah+u42pT
	PCgDht5J7l1T4FCk7q8/1bnOUENXkMytviJ3tyW/at5L0r7CvoJu5Yxx4OiqeSLNkdviWTWSm4n
	n+JqN+jSUyzJ/YDEowlHbkDg0FNmZvLY+Hbp9AUgYdDRFn4073dZ4b84CKFa1mEg4oZnXeZ2kqR
	RZuqdRGfU47TDy/iU8lLhXGolCI1af58JMoXmEfZAlVtV1RiPx///SQPgqxfI4M9tmuSFAHqVJc
	zwgfjm8/umXCy3f7jKji9/uggQPEG+eQpBZnH9n87NprtZMJ7iuI0gezhQYzxccF33HW3aqse/0
	s4ZW9PWY2uaw3AarCTA+zP9r1NAPQ44U06x8n
X-Received: by 2002:a17:90b:4c4e:b0:3b4:d22:85fa with SMTP id 98e67ed59e1d1-3b41c98a150mr2948394a91.14.1795186907561;
        Fri, 20 Nov 2026 07:01:47 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b409330ae8sm7543261a91.7.2026.11.20.07.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:01:47 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	Thinh.Nguyen@synopsys.com,
	bigeasy@linutronix.de,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: gadget: f_tcm: reject a short write data-out transfer
Date: Sat, 21 Nov 2026 00:01:42 +0900
Message-ID: <20261120150142.3128421-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
References: <20261013015416.2503787-1-yhlee@isslab.korea.ac.kr>
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

On Tue, Oct 13, 2026 at 10:54:16AM +0900, Yehyeong Lee wrote:
> usbg_data_write_cmpl() commits the WRITE buffer to the backend as soon as
> the OUT request completes successfully, looking only at req->status and
> never at req->actual.  A host that declares an 8192-byte WRITE but ends the
> data-out after 4096 bytes still reaches target_execute_cmd() with the full
> length.

This is superseded by v8:
  https://lore.kernel.org/all/20261118124005.2428068-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
