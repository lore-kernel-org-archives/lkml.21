Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018065;
	b=t+V6MV4/OHOqUpWrhDkVWUAAcDRL7s747s85ZoAp93tHhihxUwBYJnTK2WfWTMMdU7Hh
	 qXmZYlWUlChddrjWE6kx7dheOX5iyYlOJcuJHquBEfFH+ILwOX0NvXYyaptjoRCWFq9Rc
	 1bG9HgBfxfJ8k/tIDpV1Upqa30BmSiDGpLyUMLRaskkgAaaPl0Sa8vGRxWq5BjV+85dfv
	 dS/C2sN/UGh9h9FcokXQipo16VuhMbJeeIbP8GLzn+/s0rzFi+iS0jAo+50GQNfFM7shZ
	 gaUFgLbyNhWTQwamISYcevGcUeXAb9RxREMEysbEoIAb6cFvDKUFSjRf0k7IECP2lfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=fOgWd5sV20jC8nMnAlt0aIAHoHA+9PI5TZyd2mD/0tU=;
	b=LSTF4pNsMlcEyrbU/HggmPIgVTZb9svTV6Zm0yxINtTelE/D9Z/aaFVrkPOt0U0ev4D5
	 AIBwicVlwP3KSO+8i0Wfl5QQuYo/CeW8pPm3fiwofLDol0eoN+rse5GNWDbpsgmIdLyVN
	 2Hu1Mw1O/VH0Oh+t4Ui5fuQKl3ok8WDamAF02MeSXyDcBisZo1g8N1qqv7WcsRoh7TYju
	 YUz8lRx6IVnipqCcnmjF3N+pE0yC8PrI9IH9inWYkWGowOXyii1aCOQFPvGKaurNpZJCB
	 xPfmn9rUwQN1zTx9Ai3+rqPyNVESvbidUwRCOtcMIJAvONPUSdk/BvvL+hP2ozTQTTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Eo582AGW;
	arc=none smtp.remote-ip=209.85.160.52
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58CE6606A33A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CE6606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Eo582AGW
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4b0348a4c79so765072fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018064; x=1795622864; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fOgWd5sV20jC8nMnAlt0aIAHoHA+9PI5TZyd2mD/0tU=;
        b=Eo582AGWIcgJhdR92/+iWkXwSsOKDEyPZfvKQIKRigDJUNEmZHiL/z5BISs0Ahlok5
         8xULT3rpvfWFvuwAEmSAHWNGr/suW6dxr9NnVKVw3AD4pnbMJ0KrhvLfM0/DVz8oKEo2
         es1stpuaCbGae2A461eqTaT/8VlIhLuzZrYfNvqgmElgh7UG/Q9oIDRX+UAkOHtwXxzj
         /lyVWaMVnMrurQdZxszakVvtxVk7nF4+/8g2qf7kIt8xOy5YtAMlTeGQJ8uo7HRhpAcW
         +9QyOaD5sgt7KSU3qbh+3kY3w/xJw16sVgsZB2tQdJAhrqomBqX/GEkgtnfUBOg/JSDM
         90Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018064; x=1795622864;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fOgWd5sV20jC8nMnAlt0aIAHoHA+9PI5TZyd2mD/0tU=;
        b=TPrkhOzTzXStvPS7mDavh07kru7syTMOEHr9U3ovonww+O1c1yRBGXTzSSLeQ7tLBz
         Bo8qOSqJhCCmHaY5lgaxB3IBwnfAn21KDobzUmxS0GpzPG2+QI7WBGAcA2S2X30lkzKI
         NdphhJtV/by5mKTL/YoLWjTNjFLKpmatTXu1Y6MrmQljsT3EH7MJvTP3psXv35DY9nnF
         bgK95d9ojd2dKo5XJPLng/vQs0TNoPYgKsGHqy8ik9FU9d6kAklAzkfHfoW/QX3mzWXy
         oJilsXerHap3jBRtDWRxRRJwWxFPtpIoGYzDYqOR0ICdx1Wj0gFQ/SwV2nywRnZld/t4
         ZdTw==
X-Forwarded-Encrypted: i=1; AL+hErENKp48JymQtnICATkZORYmSIyPxRlzi/B0TKS91P/Q52lw8aV7+9rdoxtK7ZY9bpxetBMohwvu96l7s6U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/fRTvimTtiHbcFKHNmxjezoA61VbG89vabZJ6JzWzxtvVrrFv
	lTmf2sHZWYkN+rvO+0Y3BMgyjJwoUhauaj40LVK/d9ExtTiEkWWgd+zsSHp0cP06oBA=
X-Gm-Gg: AYBFou2VWOneKcCJFSSFSDil1Adt721/s0AwCnrE3MRK7N0ff1M7rKhgnBWqYK6Gzse
	u03taVh5fEEE6jmUwSRYs0KIGX9eVaZScFXrH9VJ2gHfh84jzAw+pQysEXam9zmBerWZS2N7jCg
	RtwauL/kuFFiDfDMohrdK00PnEZa7yj6YrgKY1kvfux/LFlRIvRgPbjszLiAZjoQ0Kphzmxnixr
	yKCzJMdCvzf02oyKNh9gpFjqrO+IlMdz2mNQUUdYE6I4i/IfojIJTQtbDCx8Z9Rvv0S3RwMeH/F
	38Kf4Co2La2UV/qYzW8hLh7+//KJ9bfI2nAy/lS9pL+E55wV/idZLVSbg8esGg9UC+PktYj5Rae
	a/KBlGa7pibfclQ9YFh/8cAr5xGfS19fNUBkmk5UC4XnlBzP/KP79Osrad8WsUwuksJ78UXcxSa
	gg5y2AzLzfi/PP2On/3GVoBVsafI2Fog9xLIT4742nlDJGas0WPdaragm7AF5yHhDoRqx8lx042
	Y9g8DF83vd6ztNkXhaiwJMbw0zW2bqDjunG76YTDBzCkjHs23kAdrK+tJfqfQ41iedOboGkeGig
	p65cheWnWIPueVrkCDra+0SsJDTNSI7yjN3Lf2N5YlbPiyEJIuDjAbAiZ8Unu4/mrPAHnP3WlKX
	CFBTpdPnDIIy7bEJkjp8qSXslyy1GBFsgL5LyAuEgqu+2QfxuD1o=
X-Received: by 2002:a05:6870:ec87:b0:493:286c:f4fe with SMTP id 586e51a60fabf-4b75fb24594mr2664290fac.19.1795018064090;
        Wed, 18 Nov 2026 08:07:44 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:43 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jan Kara <jack@suse.cz>
In-Reply-To: <20261112075806.53821-1-zhaogongyi@bytedance.com>
References: <20261112075806.53821-1-zhaogongyi@bytedance.com>
Subject: Re: [PATCH] loop: protect geometry changes in loop_set_status
Message-Id: <179501806314.17649.9922558643991914536.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:43 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 12 Nov 2026 15:58:06 +0800, Zhao Gongyi wrote:
> LOOP_SET_STATUS accepts offset and size-limit changes while a filesystem
> is mounted on the loop device. An offset change can redirect filesystem
> I/O to different backing-file sectors, risking data corruption. Shrinking
> the size limit can remove sectors the filesystem still uses. A rejected
> request to change geometry can also invalidate the block-device cache
> before validation.
> 
> [...]

Applied, thanks!

[1/1] loop: protect geometry changes in loop_set_status
      commit: 6e6d4b23e92742a9f56008beb35c20ed4902611b

Best regards,
-- 
Jens Axboe



