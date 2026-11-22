Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795370376;
	b=IY/j6+gAcUImEl1o6y3LA/Q1ghB9tEDrIfoo8jwiOlOdvPYwKe4yAu7Jcy0X2/AlpclU
	 Hl3/Qi0LVYeZTR4xh4evN9MmiUaxWF2HH1B1oJ/hsUxzNqqdlpneG2gJf6K1RMCHjJ/Ww
	 1uY7z9L3FVNYtknQ6dOIOe2r4qnwoW6pChh7LC4oVGjMvJTxTw4Fdn5xQop/O+YZmSUAd
	 z5PGx6dM7ZgZS336zK7EUU+7mUdcdefIPZKl36fKTNGMf2sd703L+/dWkQ2XwS/x1L6bi
	 rNaNDm1CGVoXcKllxorv40j2QK7iz3q1dzYFSxoNI8oZ5iFuq0YQsUNkrviA67a14Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795370376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kRG8CHsOFvzuA+tHkN4sv4XPLOr4+r/vBSrY1/yx2Nw=;
	b=fVwE9yDp3aa+pl1YwqTzutK1SfJZTxpwoiw+ZUzDZ1c1AEZc44eiMMOEL1Aoiupk3YbS
	 d32B61S5qB3ucpH8K8ImP1AUA/VjCprIeXxKF8P3qx8maDS8+/uJ1DdMqtcv0bUa2cBi0
	 3ZNwBND3nqDVN3l6Ukhz+X7168IJn2hGD5jOvCy702jggf4G7Lw0g3P31TzpsaIO8sWFU
	 AEtXddGtrjEZLc1wiuFDAy7L4n05RomeWubfFgWgJgbq7n5Rjg1KLcx6W+LKaTK7vLqdy
	 58jzB0f4/a6jEC8vvNOttYX+43mt+vCoNGEGvn5IXEGqK9W52VOr1Ixlney/5CeBujg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVJ5rxXq;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FEA606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 17:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FEA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qVJ5rxXq
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so6107329eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 09:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795370375; x=1795975175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kRG8CHsOFvzuA+tHkN4sv4XPLOr4+r/vBSrY1/yx2Nw=;
        b=qVJ5rxXqnS1fjgjpNp27xj5ZpmGhDJHHUxsU/JQcEVQwffiESTTdoknttaATciXmpe
         StsjSRH3B0sokcr5x5thT6B0cyQFRNIsqQ4h+w3N33c3ftRucp9X0N2bO7goWi0/4WY+
         7PEDc9NY0UPJtEuuCcLVIHzreMnMp4rI/vWQex3QjNmEPmMyZ0wWa+IyPQvd7hpDmJMw
         9HTOEdhufNe1uza7HWFBUC84H2A0iFjVIuqoogxkuQERLH8L3m/GDSsUE5Cr15MF2IZ6
         3RYF1x0p8TrhRb5dQXvVAVod2gzAfO2a/g7V2cK0qla5u/WwNOVWLsr6MS5oZ8NazMx+
         vNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795370375; x=1795975175;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kRG8CHsOFvzuA+tHkN4sv4XPLOr4+r/vBSrY1/yx2Nw=;
        b=EXswIKF1N0A6mb3FQelSXGcbB9/Y0Ht+4Ob87Pywq7HFigZ580LKTnA7Kf3IQGJALA
         MRBOzTDKESUokRjGWfWmYcXV4dbBVE5rnFHYLZ2c5L8DXIgzXRPEiFU8NtOQl8/DQrC0
         mQQr1mcHUfRSjaoCWR64DSg0jRUs3oM+uotyY5vBMnWhZTbb5gpKAXvjG3yKKk0V4Pij
         5zdfx1GBXh/XcWi4SEzffrxTCQ/mZqQ5E9EVB6vPzE5A3pLNF5OoJQk7xwwEgDHTp2C/
         ONynRe6kEHaQE0aGWxpXdBNpfBE1WcvLOvgebjjP9947BrlNcCCvHrKIAtPjpZSwAPlz
         Yhbw==
X-Forwarded-Encrypted: i=1; AL+hErEcPeoZUdWWgn+Ce0iG6WLtB7xT5AsI/fA0zUEaDFPeVOxqkw356eeMYpalY88Cdbk80FHKiYgf45/Tj5w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TVTTD+YMSU+4hx/cVF8IkdXmoJOo0g58AwetcCvZfLejr4crv
	UvzmGtuCk4oam1YMa3+Qy3WDs3O7MOrJVWlccwEn0JWprJpFjRVKnos4
X-Gm-Gg: AZFdTZdI9qPeFypeXsb/0kabSRn2mBQwCyJO5G7sq4FbIoDns85Itm8pGTP+CUJ2yvo
	fW+Is6fCJ+3rZEz+nGd6TrE9tU8AniSLWW0VoGykXZgEv8EhB30OaQoxsQPkeOlt3Y8tdKpcgN2
	98nual0burVuNdAIOb8RH59giWuUQLE2qebzHeKOeI2kK65gU9s03rIISEQoaJ/mdPhZ+wyaWOt
	5xGfbQoVbX5BnHFgYdyu6PSRkji4pIgKT57sIjNlq7Ul3HTOwnI58JPjX0egFtYoA+PeBPJ3oOx
	XsYmLVEqX3kKqDosurvJ1OobjA+aR0N/WmjUaFtDje62ekyDvSAeuEP7sp9euds5Vq9WTwptErw
	ZPd/4NCDaUwTqJYBKyiUcD4BpaaUKVcJGuBlb7wGOKl1bWU3ORqpFZ9nwqnYB8rn6wwvvBQglzr
	yt4VF5n3588xRbLSNasOy5YQNOBuM9s90Kzglkmaj40L56L9eP2/KqsBnc6f9+I3fwJbjEABcBH
	fvwg77sWgZh9VJCMmK5X+Y+3UEdeOCwz3odj8D03xUH9JEu5QtskurelpQMTEpf05NOhv3Gfqdt
	NOxR3KbHN6Aw2HpHeuIL3+eijSfqnQtS8rzDQtUcw0aQW8VT5syuoUy2csNVCscDH7o95si2Lrb
	vWAtM5yAPCiO+IteLDwp0iA==
X-Received: by 2002:a05:7300:f68e:b0:369:f291:49da with SMTP id 5a478bee46e88-38571814b1dmr9847720eec.40.1795370374954;
        Sun, 22 Nov 2026 09:59:34 -0800 (PST)
Received: from archlinux ([2405:201:1b:2287:f57:f0d3:878f:6f93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd4efesm29194449eec.12.2026.11.22.09.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:59:34 -0800 (PST)
Date: Sun, 22 Nov 2026 23:29:12 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
Cc: platform-driver-x86@vger.kernel.org, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] platform/x86: hp-wmi: Enable cTGP in performance mode on
 OMEN 15-en1xxx
Message-ID: <awMir9K1nuO772x4@archlinux>
References: <20261030005724.84507-1-david@exultantmonkey.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261030005724.84507-1-david@exultantmonkey.co.uk>

Hi David,

Thanks for sending the patch.

On Fri, Oct 30, 2026 at 12:57:24AM +0000, David William Richmond Davies-Jones wrote:
> On the OMEN 15-en1xxx (board 88D2) the GPU power limit stays at its
> 80 W default in every platform profile, including performance.
>
> The firmware's SET_PERFORMANCE_MODE handler (GM1A in the DSDT) stores
> the mode byte in EC register 0x95 (HPCM) and enables NVIDIA cTGP through
> the NPCF device only when that byte is 0x01:
>
> 	If ((HPCM == One)) { NPCF.CTGP = One ... }
> 	Else { NPCF.CTGP = Zero ... }
>
> 0x01 is the thermal policy v0 performance value. This board reports
> policy v1 (byte 3 of GET_SYSTEM_DESIGN_DATA is 1), so the driver sends
> 0x31 for performance and cTGP is never enabled. NPCF only reports the
> cTGP offset to nvidia-powerd (ACBT = 0xA0, i.e. +20 W) when CTGP is set.

This is interesting because the patch does not make any changes to the
HPWMI_SET_PERFORMANCE_MODE path. So, if I'm following correctly, the
call tree would roughly look like this:
platform_profile_omen_set()
   platform_profile_omen_set_ec()
     omen_get_thermal_policy_version()		(you say this returns 1)
       switch-case (performance) => tp = HP_OMEN_V1_THERMAL_PROFILE_PERFORMANCE
       omen_thermal_profile_set(0x31)

So perhaps policy v1 is not entirely wrong? The HPCM == 1 check in GM1A
only tells us how this particular method handles the performance mode
value. Have you checked the other consumers of HPCM, particularly GM22
and the NVIDIA-related SSDT methods? They may interpret the v1 value
(0x31) differently. Given that the firmware reports thermal policy v1,
I'd be hesitant to conclude that it is incorrect based solely on this
check.

> For boards in a new omen_ctgp_boards[] list, set cTGP explicitly with
> SET_GPU_THERMAL_MODES after setting the profile: enabled in performance,
> disabled otherwise, with Dynamic Boost (PPAB) left enabled. The Victus S
> code already uses this command. platform_profile_omen_set_ec() is also
> called at probe time and when AC power returns, so cTGP follows the
> profile in those cases too.

The diff follows Victus S code consistently. However, have you considered
adding an entry to hp_wmi_feature_boards[] and using the corresponding
omen_v1_legacy_thermal_params mapping instead? I'd prefer reusing
the existing feature-board handling rather than introducing another
board-specific list for functionality that already has an implementation.

If I'm not mistaken, board 88D2 should also support fan curves, right? By
keeping the board ID in omen_thermal_profile_boards[], wouldn't you also
be missing the manual PWM mode support?

> A report for the Victus 16 board 8934 shows the same HPCM check in its
> GM1A method, so other v1 boards may be affected. Only 88D2 has been
> tested, hence the list.
>
> Tested on an OMEN Laptop 15-en1xxx (board 88D2, BIOS F.20, RTX 3070
> Laptop GPU) on AC: nvidia-smi reports a 100 W power limit in
> performance and 80 W in balanced and cool. Without this change it
> reports 80 W in every profile.
>
> The firmware analysis and this patch were prepared with the help of an
> AI coding assistant (Claude Opus 5.5 in Claude Code). The result was
> reviewed and tested on the hardware by the submitter.
>
> Link: https://lore.kernel.org/platform-driver-x86/CA+LW3S2g4E971by7WhfFZGuyLT47141_Zn+eJ=wyqxB_+4G95A@mail.gmail.com/
> Fixes: 286e937efbc7 ("platform/x86: hp-wmi: support omen thermal profile policy v1")
> Cc: stable@vger.kernel.org
> Signed-off-by: David William Richmond Davies-Jones <david@exultantmonkey.co.uk>
> ---
> drivers/platform/x86/hp/hp-wmi.c | 34 ++++++++++++++++++++++++++++++++
> 1 file changed, 34 insertions(+)
>
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
> index 52077833ac89..e09a6d261144 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -235,6 +235,14 @@ static const char * const omen_timed_thermal_profile_boards[] = {
> 	"8BAD",
> };
>
> +/* DMI board names of Omen laptops whose firmware only enables NVIDIA cTGP
> + * from SET_PERFORMANCE_MODE for the v0 performance value. With v1 values cTGP
> + * stays disabled, so it has to be set with SET_GPU_THERMAL_MODES instead.
> + */
> +static const char * const omen_ctgp_boards[] = {
> +	"88D2",
> +};
> +
> /* DMI Board names of Victus 16-d and 16-e laptops */
> static const char * const victus_thermal_profile_boards[] = {
> 	"88EE",
> @@ -2035,6 +2043,17 @@ static bool has_omen_thermal_profile_ec_timer(void)
> 			    board_name) >= 0;
> }
>
> +static bool has_omen_ctgp_control(void)
> +{
> +	const char *board_name = dmi_get_system_info(DMI_BOARD_NAME);
> +
> +	if (!board_name)
> +		return false;
> +
> +	return match_string(omen_ctgp_boards, ARRAY_SIZE(omen_ctgp_boards),
> +			    board_name) >= 0;
> +}
> +
> inline int omen_thermal_profile_ec_flags_set(enum hp_thermal_profile_omen_flags flags)
> {
> 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_FLAGS_OFFSET, flags);
> @@ -2045,6 +2064,10 @@ inline int omen_thermal_profile_ec_timer_set(u8 value)
> 	return ec_write(HP_OMEN_EC_THERMAL_PROFILE_TIMER_OFFSET, value);
> }
>
> +static int victus_s_gpu_thermal_profile_set(bool ctgp_enable,
> +					    bool ppab_enable,
> +					    u8 dstate);
> +
> static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> {
> 	int err, tp, tp_version;
> @@ -2096,6 +2119,17 @@ static int platform_profile_omen_set_ec(enum platform_profile_option profile)
> 			return err;
> 	}
>
> +	/*
> +	 * Enable cTGP only in performance mode and keep Dynamic Boost enabled.
> +	 * dstate 1 means 100%, as on Victus S.
> +	 */
> +	if (has_omen_ctgp_control()) {
> +		err = victus_s_gpu_thermal_profile_set(profile == PLATFORM_PROFILE_PERFORMANCE,
> +						       true, 1);

Why enable Dynamic Boost unconditionally when the firmware would almost
certainly disable it in case of low-power/equivalent modes? Wouldn't it
be better to make PPAB follow the selected platform profile instead?

> +		if (err)
> +			pr_warn("Failed to set GPU cTGP state: %d\n", err);
> +	}
> +
> 	return 0;
> }
>
>
> base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
> -- 
> 2.56.0
>
