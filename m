Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795451160;
	b=xbTkec9iJbk711CVRJ+mEzu6ml6Sz0I3IBdt/NL7U88tShlV+jWKG3IqHkoHRHvxmw7c
	 DmtWmXlkCRY8h3q7NpI8MF/ycgn17hz9dLMeldF0yVw5cSW3ENOMRxSYaL59y40tErKqr
	 EMN7U/W3Rlr5+20AWapwYJYJqFwW/yIZtLfe5s61zOF/2TlPkwTIE5zSIzaBbUvJsFB2l
	 nCI/TRuJRmq3ailYe8d1XZdZiip4pN44/YV8wNwZ+YWYuowmRGGVkoQZcJHTrTQPnlGl7
	 W0yZcggjCHsgXV3+ZYAFogDV8QMuGB0XXj7X56NaJDeWJtzYoCi7CqlMOFUBoVkyhew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795451160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
	b=4XfnvvZ+0Ujvu4bljFPMTVhxwHqr7/ILXsAF5berUDxJUfHMUBuZ+GsD4X7NJ56WHFdu
	 W1rgujCFWr6+oAEwuIuwxAf/jhjlVScGFQEAvYbJrqxuYU307nMazwedc8bgbXJN/CzGd
	 wLU9ltxQd1FXYxzS3YwRW+w/CxoGuZPSCAxiJdumhG7e8N8sA30f8SgZ/z+x03Z/Tb2gz
	 GcC5eXt1Ol8QMKuMiuAdsMiN32yPoSAaAhEwLI4OX5ld1khYMOAHFe8HyPR/qmBon+vaY
	 PEx86uUPxjRDcQdseDFta2I0u4E9/H4BsBOuIdLpMQRNziBxGr8/wJuOWvQX53ehElA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7yNcOt7;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B3F606A334
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36B3F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x7yNcOt7
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b5e5e64494so1843573b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795451159; x=1796055959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
        b=x7yNcOt7cT04fs8xUAzqjVFJLIZfiwgG4K+XlUM0mKhEjtJOq0QTYSvY9aMwLMdn+A
         gkS5xiradWIfP68GPDpdqHUzpvGyzaZ+1O2fri75fbmrtWOBH2milUODDsf2Ewb1KxYj
         fEpntjb43R3tigO4706ht0BCQ5s1euLdqDQuDmdKIladlclpbd5on4B55ViqFwgXIS/U
         So6kHhXDq3Q3kyf0FDFpIrhNER/32RClupvVhyfz6o4Qds8nb+sQMtVgBzKYWjFaxqEg
         +bv1RidgKDsx9uIGdsqEFTaxWcKyd0v4mnrhkxFdH0uJSBfROhcjA2X6Xm+KQvQxStHh
         P0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795451159; x=1796055959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UKsPhBFXVevVRUvcrB6+ZjmJljc8N9iawL0bPcXvtQY=;
        b=OlYlEHW4XzXtcQ3JxifAJPGYTDrzJeKHIBKRcA163M+f826qjiTzV1+Jxtpw8HrsXY
         MB6KxV1JUeAh2x44EapY/KWe2RH7WYSr8iFwrtNdt61nG7aO84VYUlCSwYLZBw3AUdiY
         AA5LI8pH0zAWqrezktgyy41p/hjr3NJVNZozbDsnpeITECx6PJppqP3FV2SrtNb68QIr
         7tlYMAFyPndlXZZyEapt7920qUu9veiqi3/YURNO9y5QH8eiDAhHzldn5eViKlkUi58u
         lnmvCGE45H5kbMi1iGL8y00XrhjEdZRBR/pM3FGuhbSScq+S1Mu9eFbwYBMBvKd0UG4Z
         hlvw==
X-Forwarded-Encrypted: i=1; AL+hErEY/vUj5dD9/O4CTcCI/Im5OWJSe49ekUh5Z3OSyBVHTg0LXUqmpTjnxqtbNmo1aIjvZpDky6LwHAX0hpc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6XtEmMKMJX1yENRHtOQ5TgXnu6/WJmDwTspip84LqdhVZ5dtO
	pyKNyUv/IbLVLzGgX5WTNjr9lW8aXXBVlJH2EvPgzGd5HL4j58+rHMY=
X-Gm-Gg: AZFdTZcmuOC/+1sT7N3/O7sS26J2o50A8cqn9eDnjTOKJ3EA4eMChLE/K+X5fLzredu
	/YlJP60t73g8Et5m55eRa/V4bV5rsA9ul8l0z3IYfIrMllFR4ciFqLehVbF6F4OsVHOFyR/pzJx
	V2ESpIei6G7sB/r6nKmZ2Gijs1hkuiIEYUEdeVXM9aozqtIDJXscSymNr+NKqdFZxZMPsr6Dk2L
	t8lhze0CXxzwb5bnFsc0endjA9hUDry0hXDwMgTvOGkGlzZuPx5y5OcJxmnN2kCyDpH7+FVmgZ/
	LbzgOV1Wu0miRjV18SY1JL6eRNwcmcCQPORQfkR/VsAFerJBo37+SLPhMmdYEC0dYVp0EAb0w2O
	Ld2+f5rNpr0K8zF11BUFeYHUkJ8QRMktR7ezlcM1UM+2EpDzGNRE19s/dGsGaPtUF7EMop9/JKm
	6QiO/RGR3cIfF3VyxVLFnN9Z8uZB/0MfBgLXr6kdTSs9MgDt5XnSLMrSbhho/OvlC9p4UYardtJ
	G90Ds1gl0af366tT6oHFl+WzQ9SM2B/tUsQ5aEmXVpu2krehZ8EF4uHyZrgnJ12BciXxsyb2HuH
	gznQS+uSrpGn4uJk3TXIk8qNb4O6MhXnFFDHvk86LqVuciw6+BPFxM7S5uZKWCI=
X-Received: by 2002:a05:6a00:94c8:b0:89f:129a:9590 with SMTP id d2e1a72fcca58-8c87d01fbc2mr10377955b3a.48.1795451159489;
        Mon, 23 Nov 2026 08:25:59 -0800 (PST)
Received: from [10.1.1.198] ([71.212.222.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm5904879b3a.28.2026.11.23.08.25.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 08:25:58 -0800 (PST)
Message-ID: <6052053c-5e1c-46e4-98e3-e6e7608683c1@gmail.com>
Date: Mon, 23 Nov 2026 08:25:57 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: skip the link teardown after a failed enable
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 robin.clark@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xilin Wu <sophon@radxa.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 Gianfranco Mariotti <gianfranco.mariotti94@gmail.com>
References: <20261104072048.3486286-1-burke.cates@gmail.com>
 <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Content-Language: en-US
From: Burke Cates <burke.cates@gmail.com>
In-Reply-To: <0212b0be-857c-475c-98a3-165df9de34c7@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/11/2026 03:00, Thorsten Leemhuis wrote:
> Was this regression ever resolved through the proposed or another
> patch[1]? Looks like it feel through the cracks, but it's easy to miss
> something from the outside.

No, it is still open, and there has been no reply from the
maintainers. 1bda647ce61b was not reverted, and nothing in
drivers/gpu/drm/msm/dp has changed this path in v7.4-rc4 or
next-20261120: msm_dp_display_unprepare() still calls
msm_dp_ctrl_off_link() after a failed enable. The patch applies
unchanged to both.

Two other postings touch the same function, but as far as I can tell
neither covers this path:

- Gianfranco Mariotti's 7/7 has a Fixes: tag for 1bda647ce61b. It
  gates the dongle power-down and PHY re-init on dp->plugged for a
  cable unplug; the off_link() call stays unconditional.
  https://lore.kernel.org/all/20261121214105.32596-8-gianfranco.mariotti94@gmail.com/
- MST v9 08/29 replaces power_on with active_stream_mask. After a
  failed enable no stream bit is set, so unprepare() still runs
  off_link(). My patch would need rework on top of it.
  https://lore.kernel.org/all/20261119-msm-dp-mst-v9-8-ca61be4edfc3@oss.qualcomm.com/

Xilin Wu's broader rework (hdr10 v2 09/20) has no newer revision.

I'm happy to send a v2 or test a different approach on the A16.

An AI coding assistant helped check the trees and draft this reply.

Thanks,
Burke
