Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795746442;
	b=uGoMmlPDb4fiazGLf98KBLDRVRcKZX1SSUPaf64Fot7sBc3e9BkyD9KlVajGdbQxChyy
	 3MtPgwL8mcG1ng6q9ZQDPQhNbtiX2Bojl7QRgX6rLdNdtffvqsmgiWoeI93hGiJhrZ+0O
	 /OKkM/bTBMNw0ovxhLojLrc7Mrxw+EWGRwoolMxsi8ItznWRjyLKwy+17T7fXdgt8SGKR
	 vWtVWDDSUGg18AGfvbVGUfdQ/ueQlKQa0+R/Crdi9lwL1gkMxYOhiHXN1oPgljtWGA7Qy
	 3PaHJmRSpE18k6bTaUvivn7b9MGGRv1YqWFcqKbFnyV1VQ+c1pmlvLutCX3mLOIUIEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795746442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
	b=HsN8/lPpHD/k4Tvq8B7BR1fUfiAwzJpXQrnSV0IXj+mDFppqPwfERSv5U3huvGvMi9sy
	 lAsvU/tvbYBrhNMbXu+pYl4aX/0pXmylhlb/u5tXBGS1Cr64sSateCAmbdM+TLAFExjig
	 aeBMaoc4TK7LggmOYZQ92AQVWbH1T2eUkCl7YiGqLkXwWXuGa/6jdG++fh1/5DK0ykVVk
	 Ag2mKEFkx0s7+ZAm53kUXvWeuZ0Ipyn81KFzuZ+kK0+iXNu9rhcS2lo40oMAzk4R1pa8/
	 e3HzVjSohv2SiZFhawoTU0hBvqXNm1i8/DfzGs2JJbIYCu9uFMKUr5vnpGyQVzrJjwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0AnO2nFj;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB6606A321
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:27:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CB6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0AnO2nFj
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b44bdcea8aso4311430a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 18:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746441; x=1796351241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
        b=0AnO2nFjocMs97/H4Jy1ZdrERBynQBka7/uV33w3HI/HSsWxdCxOoXTXOd8jdWIYCK
         MDR2rji/EwLvqis+3SQmD2ljHQvy69WJD9Fn2gWJR8T+YNOu4M2FaEtqGuXjoCuVBvrW
         SuLkMvoDl6n+qnQT6PEdvEsYL3WfMYcKp9iKQ0xq5k+ntv5xYDEhHQdLzQH8HPA06qTX
         5JLunRoKBBh31y2fsVSpaOo3hlJZtVJF4O5usYsfuou5k028Yy1Uv4yUmQBC0MIKeTAE
         Ia5zrlFxcLpWq+uLXXNcdhuU5nPMLjz3jwtA7e27APFtQCr7HhbY2BPfydB2qd7bCjfm
         Fjhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746441; x=1796351241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kvVsvJjIcPmelr/AshpBT+XywkQ9wH3ZnOEGYSU024=;
        b=BOT0AXEOkz22bcBZuf75WJh8njJjKVTy0udiq2C4vcXyhM1s1+Q1Cy/kWFI4TxCVnw
         KgNT6IkIQJ/2Y4BK/zywqs2yQIM+yX7oPV74X/WcxnkNJnzMMPW93GlYkVAGOTeJLhBi
         pcJf3OWw9Upimi00PWAlJwUwVvD9XBJUXTA7NYrqEz7vv+TIHE7Jlu6GpwJcAAVz8p//
         MdXEY+cWR6ZTHslhgdvMNCrjnuTfmgLX0xxc2LCmJZCeQiV7pF0rgdHScmnX12cgBro6
         vHxryFnBJpDo4tv/Oy5x4jQxORf3uxRxU1ftq4n9xb4k62DgsSk124AwgIdfLPr01n7X
         oJiw==
X-Forwarded-Encrypted: i=1; AL+hErGInqg7hSP+55AtgBoLPusZPzePKj4v+lt4m9HHwRn6Z6G7PWsIM5Jy1sZBWksXSJG4ylS+TJZ4890KyRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UDUOvvN+aSNdaV2qhUJt79vBMZm+LBYh0s5GHaaUGJClkWr7w
	7fTW89nR5Kov2HLnlZdclVmJm6R9eCLZFZa2QL3gY4W6CCHLt7z4nuqf
X-Gm-Gg: AZFdTZci4l0ckAl/KNfJkNpHFER9MNHwHXtoh5l4KsXScrE2XhQyfKfl0vkeDkWIURw
	FJHk/ekYLif1XmjMaTkShXI7UD+SbE+zWXqjFNzMKvOt7EcBFlAq1axcfP6FPpSA0L4o9Lnf9P3
	88FrhLSnzkO+VFcVN1CXTZtYqGtneBixL27kdbftFLnahJnYtSUlleqQsPBmhf67oDLYI/bN34E
	3aNcIxAi6AlI+vN3o4KjoMOYr66h4o4mVrLRvCEgSu8YRFp/7Gg9ALkfCKDV7CQygkVHmMq17lG
	VP5SzpKkdJV+geYnhChlOWeo5LIBd870CEVKuevwvueKVZaD7L/fHCMdR7b3mbeRhoZSLfVg0LY
	w5O61xHcsmPbwnKJVBynFUPJy+GmFVT8iQLYjCrcnYYKOy9xWAT4Ou9L2tk7rwsH01NXIjYduJH
	ScE6YliOoeYDEeS1cA1TVKdBWWA7AzLOigLNwjfWZ3H7bf174qNy/hqdR82H1Kn7SRO6jsXMLSj
	dNqh8tXMmoS9CZ7XAJ5iE8DEaCN9OX2Y+mmXjiuOIt6Uhn+m5FlFxc7TcFgrO4F3WoO5AKExL+q
	LFqLI7ZhvJ/prJ+JPIsZpumdOjJ4nF2L3kYDVRWR2Lh4lH7s4QnuKlDVbXgUN77PLDQITa1Rd+w
	+B6X375w=
X-Received: by 2002:a17:90b:2416:b0:3b4:a6ab:b846 with SMTP id 98e67ed59e1d1-3b4a6abb9e0mr6418713a91.17.1795746440731;
        Thu, 26 Nov 2026 18:27:20 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-229-10-180.dynamic-ip.hinet.net. [36.229.10.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm37142870a91.3.2026.11.26.18.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:27:20 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: Slavin Liu <bolin.liu@seu.edu.cn>
Cc: jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: pispbe: check configuration buffer CPU mappings
Date: Fri, 27 Nov 2026 10:27:16 +0800
Message-ID: <20261127022717.685080-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
In-Reply-To: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
References: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 20:52:24 +0800, Slavin Liu wrote:
> Reject the buffer with -ENOMEM before copying or validating the
> configuration if no CPU mapping is available.

I tested this on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39),
together with the other two pending pisp_be fixes, by rebuilding the
pisp_be module.

Queueing MMAP buffers on the config node still goes through the copy
and pisp_be_validate_config() as before (an all-zero config is rejected
with -EIO, same as without the patch), and v4l2-compliance -m on the
pispbe media device passes 400/400. I couldn't make vb2_plane_vaddr()
return NULL here, so the new check itself isn't exercised.

Tested-by: Roy <rongh7426@gmail.com>
