Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794957362;
	b=KP+hcVSlt+LHHW7jpguwW5oN0sfLBPfAd597rTjiI+Alm+OCsHXkUFbSugPF1x50QWCv
	 2L2VCl0BqJcQZr/mEP6j6uKlzyqRjBn771QAeWc8MP90/KVppiC+lgUIJg5fDjcTPmx3D
	 71G6iU5G7ViLhXhfjW+4G6Ja7Cvj1eOcVY1XCkfvJPKAbup0qV+vuiM/XsR8h9B5b44Au
	 0u5TJ252Ou/4wMZsh7kHvXpqFtrjsKDt4lSbALgB5cemsHiRt5SPJ9CxCw/TbAWsKskr9
	 cMjp0MIix4g0xPaHnUnH3zD1H3rKVVlVk2nmkPOyKZB69CMuaqHw0mvxjPSZgcMo7xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794957362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TRMivUc7hqRTQvc/18oEojYCHTXC58DX0V1KO98MI2M=;
	b=CtVnPnk6lCmnT/1nqbG3IX8KzANPtOieWwgeQSVF263WPqzyfLg9v7xpZI1t29XXt0jb
	 O/1aqqqsdRZHhHygqsgjkkDWoIdcNG9cgFYe7ORA1mxjFAKBj6tXhLIGizDvQ2rxTN7Fk
	 zshKehAA7rlwKMlK4VLccHcCMX/GVe+N0MTryoprgMvvdI6fzqHXoNe/URdU1lIjMPBwC
	 K729hl/XK7MEGwsMtLV5RlFr9XdCUKDT7CxbdxAS198HV6QvkPuT5643ckmtL0YroHjbW
	 Cuk/0NFEpPe+/3y5GfAkuG3iOvu6sg3HFzGDuNWMIA6gtRq7CeVJCE9KSpbRWpQ/omQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDtAapon;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85267606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85267606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HDtAapon
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so180241f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794957361; x=1795562161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRMivUc7hqRTQvc/18oEojYCHTXC58DX0V1KO98MI2M=;
        b=HDtAaponU8iuheZxm0TK7UlnWpKKIanDuRpm0K8iUXODXFC8oB08VgdY389dtRDVty
         svj7S8QmFk5Elu1RhzPifKl9nKShjuDPiISTs4ZHt0h+esp/uvImwBOSz1kw2rCYVh0w
         /STHo0/fUPsbrGLgiBUVb0uiH1SIbymyr3RmRfWtBKEfxLgy9dCElp/JZ9oiL6PHrOVk
         sDJXXDHF9wV1+ZRIQA/CW9D6iNRj0QUQKa3Enon2qqaT8/RqWJhk6PnpronAxv6Yupl9
         nWtq/RDCEoiqyGmWL/AZP4PSijS9sxBNAkwnO78faFg57Ra8vnieP4pY+GH44uR3aaDl
         XD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794957361; x=1795562161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TRMivUc7hqRTQvc/18oEojYCHTXC58DX0V1KO98MI2M=;
        b=vtJ9UVbMtlfJxKvko0C32tX+P14HweNNmaw1TNRgVlpIwYKdt24NQi7Zb8rWS1oE5e
         V4QROYArRaWqjmkixQuURb5pzzO/BtBbtB8Kml6BAtIQUip9n45ANzRroDiqkQjCRdVp
         0Y+oQRqePI4TXOh90+071ABSxpJlDkD1q3rGAe6Q/uA7Qr4cyT0MKi+cGakyhcgkoYjr
         ZDukEBFitzmLbcNe2v35Vbvo6nfhDuQWpkIPIhhBliv/X8WfmFS5587l8yqG/7Z/xN+y
         73OWfSWhrs2UVaTRYpLxUc75ZZemubJmBot1KsodtOk4UUrb6SAJHFzUXsY5L88+MSE3
         P0LQ==
X-Forwarded-Encrypted: i=1; AL+hErE0QM0to1Xm9TMpVT0aMKHnn/JtspojwjLZGz743CnMMRpssf0k5QBTBYxUetfEq+RIUCORBNINQHUX6i0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ogmkstOR4qsL9YcuwI/49nCDJGwPQDLF3QQ7nsfPwmKUog/Tk
	4XR4IZq0Q+Vx4N8hnJLsTMNCm8jhbsq61Vh7y7RboSLJxgr2vm/twM9a
X-Gm-Gg: AYBFou3RvIMeJyYSK7uWRZO6RNeJIQNPr3qXig3Qk7AVSiwfYmLL0lsV6lZf8shR+QC
	/2qT9xwf0kkDtRNWNz58eyCBz2r+MQSeddpn4xh/xjUxfICVo5RsaPSpSr7Y2OD+TYjEXf1lS+L
	0PqeEzalowFqlYo/1zhCg07uOUJRO+y7CXy/npiM/PPBpxLKJa3GDcBsvIIoOeckuc4I7ptKXsQ
	6jti21+1d1reOppsJJVzguGXLqsRY79PsVQLcwEwTHqBB/Sy3yJwJ5UEQKuSkcxfszpUF3u4ot1
	m3sm94swSQ8ZKL+z4zQFVcPh/hfaufRzm3XbuKXzDrORjYtF3QUpSeANjLBqJP8NWdFQ9CzaH3L
	fuscgffgcZO1xCzxM5Lz+8ysGxoPZhmkWFuXSBU+Q1c3PvOH8r2lsZ071wWtV06hrVLoo9SARng
	EDT+9YzSPBBRfLjKBvO9CwPXHZ01kDJHOtStSA0aja2WoUfbmy15hlcPpFQAKR+cyzfcm+scozX
	yTyVcxZjLltzzWjVwiaQJdXIGfBI58fzfS0eDN6mJJFelAy8lBrBBiTf7EqgkoAUy/KiLLy8X1F
	4m/OdghwbtViA9zduNnq/2iTNCC0FpiwI6U=
X-Received: by 2002:a05:600c:1f84:b0:4af:c210:5b3f with SMTP id 5b1f17b1804b1-4bb7da236c3mr12822715e9.24.1794957360715;
        Tue, 17 Nov 2026 15:16:00 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d4f5b87sm11533105e9.2.2026.11.17.15.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:16:00 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Zong-Zhe Yang <kevin_yang@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 5/5] wifi: rtw88: clear the restart flag when the device is stopped
Date: Wed, 18 Nov 2026 00:15:58 +0100
Message-ID: <20261117231558.1952531-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117171003.1840491-6-mehmet.fide@gmail.com>
References: 
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

Hi Ping-Ke,

Commit 3f2238709f5d ("wifi: rtw88: clear RTW_FLAG_RESTARTING on stop
and start failure") in rtw-next fixes the same case, so please drop
this one. Patches 1-4 apply to rtw-next as they are.

Mehmet
