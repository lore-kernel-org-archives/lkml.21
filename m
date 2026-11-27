Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785953;
	b=3uAx8H4sNNm8kK4wRTo9FI58tGa08vDsi5RzE78f0p1W4+6CoSVG7UWQaOGZQuPJdqZu
	 D7rN0Y/z1vwFpntOwq08r4+oIoxXdCXN7RGjpWu90C+40MVwcHJMalp/Tsxsda1RjiMKH
	 jarjBvruhzkd1kdbEfhmL4AkPUbCj5DZcplgb6dtO3/HeuWJ4dVZjO3c9gk9Bh1imZT3P
	 PuKFM/z397k/FW9P8f9aClP0RshI/tI3S7zZ5QEX5ctp3rGgnR5zJXrh6DH6J4RIaWRry
	 s2bs/U3LRFCCM6tNt1+PNxMiWAOhLgfP0Qw+FOzlaOEfxUY75fRbG52OMivsuSU4ytQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:Content-Type:Date:
	 Message-ID;
	bh=nO5pNbEMq4ckZkkDrDFMXKAQltbx+d+gHgPNIH42jTs=;
	b=pkbiEWcii7+moyDAHv3UGrxYUian0NmIrSdinu5VK+qbwghDHTGxktWghnXbCpAFUWLl
	 VK9eXvcrdag9MNQK15jry4B/5QNNXHYnGyHvrnP9lHNprg2vnZJIELA8XavhdTeyVPord
	 Ns+iT/ine37fIZbc0/UW08vOkTxonOW6tVX+cp40A/0Ls1uR44SHRCxApDP7/xwtouTYe
	 EnZm6Sn+QOUzOXgtQhZM59y8qG0w/mm67ogaI9ErnKluhb+QqXRIQjxuk2Dtj/6nuSQbN
	 Th6iZGCXP2WtAZkQ8HZqFaMmCPBKL0jH9gYqXFngRYCZpmjvxIbFtSQNaqMPF7tNETQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Nq5/dzqX";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D90E606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 13:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D90E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nq5/dzqX
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so3268761b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 05:25:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795785952; x=1796390752; darn=vger.kernel.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nO5pNbEMq4ckZkkDrDFMXKAQltbx+d+gHgPNIH42jTs=;
        b=Nq5/dzqXt5JHBNsN2NP5jngxIpRTmvxiKcOD9sL7GMETuCDkUyX7is4yfcyzcO2dQB
         6oON5V34pqU8wcEn5mnNqaHFOPA69P6Pydm3TCwknWnCo7rIu34cFmR9Vt0DoFcWzZWL
         nby/vCyNnAovVV+6xOqcIchSP7PaKCFc1FP6SpSYRQvEzuc7szyFNWjvYZW97JGBcbeo
         2FxTeEkwb3a6MkDOCkTvTDZO8hFkJ9kCsht/RDG24G+vgaQ9RDF60mce4CyuLx7tbP0o
         1DkSmPUiU3DlGvouOXwKqmrAOPQKVVRnqIX8bAYxOkoy2e0emMM9bvTI8yA4ur2PMFV9
         eL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785952; x=1796390752;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nO5pNbEMq4ckZkkDrDFMXKAQltbx+d+gHgPNIH42jTs=;
        b=ylr9KQc0ImsMqD1fHzWNhg8SwcsfujKT3vefYQtD/Vp5DOy81ivEnajTZcwKqkPiIh
         YVPWM/f6ECO1ov4rrDf6kZ3W/4H7ynSzYUWPMQlLAjs7zvjtM4sTzLdEYymhYJyriDlM
         RVMA0B7jaeCrUHH0q5OU0x1y6W1XXIqS2mvbw9mgKwyqtPhxSM8DP6kJd+c0tafNoU1G
         7bRTp7p4+TvnUxESFSybDD0ncFCzokZBLyCRTTIBN6W1/Rq1V0yS7Hbvrayb7oyD23Uj
         6k+PtOrMRwRxJkDOzkdtv+XJEB6vw2qFQjyVszYt7CfvyR5MtB4s/yGR41XOfqCO4DXW
         mamw==
X-Forwarded-Encrypted: i=1; AL+hErF1H7nHMhbvm+QIl4/Q1QEy5Yfk0sDdQTu+a75ovJqri5b+mlbfF1sgUnbg6q1oDKBtzZHLwdzCgRE7Tdc=@vger.kernel.org
X-Gm-Message-State: APuU4Z82ZKOmVLsHUHgWhsQOG6GYPb6Y2wIEL4gNuSOSW5IsQmhHsyLn
	lqTMtqxgJmpVdYeuwa/Qx8PVXd/i8kxIIIbKmLz7PwrA5rMLBQetoIQB
X-Gm-Gg: AZFdTZdvPgzbB6qDw35NKgJiJrB1nCNLz5opKa9V1FB60NCqZ/AU3Yx6HlqOAEExe55
	k5M+9rhSNZwC5MhJPSD3+GosZm+RnL+fVcEQmo4xR47Cjw9jvESwfDtQWP8t2ifF2vkf/lxJ3mw
	MTj0+DSu6StOm40U9Q20hM66jK2bMYMLC0+Afvu0bhUte1W7IYLRcKm/aNRivc+OvLmP+7cdo9V
	ujXeexzUxeZ49sxaD+IukHQ07TMVIJ/Uaa4Gw+qE4+OzkE0IVvW+6M9KJjuxcNIKUlVq0hMRpeg
	zkpFcqKrj5t5oiuHrExq021TD2tvU4TMrFMomvGysHMP9iW3YUFXa2eM3MjN+v9Cdxm3T9Vy+WF
	5/TWec7IJM6LDQ5kySVLEo3bsCYAUG2LzX9jJF04WEbEcdd6MfWIVuUnmvMJrNAhWP1Iscm9fEV
	5JR+UgawQw5nvzzjKKlewsxSXTq079DCrIHzGVP0ALfTSmn3KSKrzEtFmC9weGIfMPboQttX8gZ
	GNp8mMRL1Yp5ZNyqNSbS/ctrI+h8EpKDK5rFqeP3mDRgYggVw+e/FuM758E6yb99g1vqt2nu4H8
	GjlBNNCVErzLkS0uVej4e5c0n9EOYKJe2Ub/FsqDtWRx5lLTMTfL2HNSJsZVVANw0tbtkfvu509
	+
X-Received: by 2002:a05:6a00:18a0:b0:8a0:76ea:36e0 with SMTP id d2e1a72fcca58-8c87cc45db1mr21594130b3a.40.1795785952316;
        Fri, 27 Nov 2026 05:25:52 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87344058bsm12383725b3a.41.2026.11.27.05.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:25:51 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>
Cc: martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] scsi: ufs: mediatek: allow clock scaling when
 ufs_fde is absent
In-Reply-To: <484a58e10c4bc9cde24ef731a4bd3051b9decac6.camel@mediatek.com>
References: <20261126031008.27506-1-iasnezhkov@gmail.com>
 <20261126031008.27506-3-iasnezhkov@gmail.com>
 <7b7d94ab4283b82aec13eae3f9c1d2e77873d88f.camel@mediatek.com>
 <179574184161.52486.4990124402659702610@gmail.com>
 <484a58e10c4bc9cde24ef731a4bd3051b9decac6.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 21:25:47 +0800
Message-ID: <179578594781.39039.17064629203450675282@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Hi Peter,

Thank you for clarifying — and I apologize for missing
ufs_mtk_fix_clock_scaling() (commit 86a678a25108) in my previous reply.

1. Why ufs_sel_max_src / ufs_sel_min_src were set in our MT6789 DT:
   We initially hit this on an older Android 6.12/6.18 tree whose
   ufs-mediatek.c predated commit 86a678a25108 ("scsi: ufs: host:
   mediatek: Fine-tune clock scaling"). In that local DT we added
   ufs_sel_max_src (msdcpll_d2, 192 MHz) and ufs_sel_min_src
   (tck_26m_mx9, 26 MHz) to idle the ufs_sel mux at 26 MHz on a
   small-battery handheld.

   Re-checking mainline, you are completely right about MT6789:
   ufs_mtk_fix_clock_scaling() clears UFSHCD_CAP_CLK_SCALING whenever
   wspecversion < 0x0400 and calls _ufs_mtk_clk_scale(hba, false). So an
   upstream MT6789 DT should not define ufs_sel_max_src / ufs_sel_min_src
   (otherwise mainline would permanently drop ufs_sel to ufs_sel_min_src).

2. What behavior clock scaling changed in power mode on HS-G3:
   None — because ufs-mediatek does not implement .freq_to_gear_speed,
   ufshcd_scale_gear() uses the legacy path and only lowers gear when
   hba->pwr_info.gear_{tx,rx} > hba->clk_scaling.min_gear (UFS_HS_G4).
   At HS-G3 (gear 3 < 4), new_pwr_info stays identical to hba->pwr_info
   (and saved_pwr_info is also HS-G3 on scale-up), so
   ufshcd_config_pwr_mode(..., UFSHCD_PMC_POLICY_DONT_FORCE) does not
   issue any UIC power-mode change; only the ufs_sel clock mux switched
   between 26 MHz and 192 MHz (plus ufs_mtk_scale_perf() PM QoS).

3. For mainline Patch 2/3 itself:
   Even without MT6789, commit 5e5976f5242d ("scsi: ufs: host: mediatek:
   Support FDE (AES) clock scaling") left an inconsistency in mainline:
   ufs_mtk_is_clk_scale_ready() only checks ufs_sel, ufs_sel_max_src, and
   ufs_sel_min_src, and _ufs_mtk_clk_scale() already gates all FDE clock
   operations behind clk_fde_scale (mclk->ufs_fde_max_clki &&
   mclk->ufs_fde_min_clki), yet line 2065 still returns early on
   `if (!clki || !fde_clki)`.

   As a result, on any platform whose DT provides ufs_sel{,_max_src,_min_src}
   without ufs_fde — including a UFS 4.0 host without FDE scaling, or a
   UFS 4.0-capable SoC attached to a UFS < 4.0 device where
   ufs_mtk_fix_clock_scaling() or suspend/resume calls _ufs_mtk_clk_scale()
   to switch ufs_sel and update dvfsrc-vcore — _ufs_mtk_clk_scale()
   silently becomes a no-op.

Should ufs_fde remain optional as ufs_mtk_is_clk_scale_ready() and
clk_fde_scale indicate? If so, I will update Patch 2/3's commit message
in v3 to describe the mainline 5e5976f5242d mismatch cleanly (dropping
the misleading MT6789 example) and carry your Reviewed-by tags on
Patches 1/3 and 3/3. Or if ufs_fde is intended to be mandatory whenever
clock scaling is enabled, please let me know and I can adjust accordingly.

Best regards,
Ilia
