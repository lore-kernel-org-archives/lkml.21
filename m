Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.216
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477102;
	b=f/9Qb52PkjXUe6JJb1IUnbpkr+xtR2MOEMxnCUdkR67e60eGJvK2wdg7ALb58gOjh2Cf
	 B/CLioTwsYzp+tQQx+rOJDZYTO3YIFCW6BMBAtoY65Z0PgwxxumIqhV0tVZEBfPiauZd5
	 /zX2uNP7o/+BNQO//i6Lod9mDZ1k9X6F8+34f86Mfu2PkR4+OS8rgLZDXTpowzCpkkC0b
	 KkdqUZ3g7boa5prV3o2DBzr3qpPQYK/smszrGLHWlALywNYrWgJD4l1SMwlCm1X0tVcio
	 BqD6MNJqcC5ars9QwUAXl/ARj4wgDmOR5tUzXgSyWoyHXisq9fy9a7OokFIvMC7CvWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477102;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=KCnwmkEmE9KD+1uFCSdTtPwWMIkmIPWrLfClVd8l0gw=;
	b=jby+9fymdt8ENRopaB/yH1279Hto/wl1kw/n7uuhBnv/t2jxuAmcFcO8g++A0wS0afYM
	 iC048LrCxnbpP/3KkmVF4XEe3oAI7xyDdtEzKqcOXG+ds4xJX5KjiBQDOIgPKaqEh+uPU
	 //ck4G8mx0ntEN51KYi6qbyqYCPeqVpxrGAKFMvIi7qvJoJoATm3pr8EomdTtBGSvJB8x
	 vZRrSBhi/2AMyaXFT5gPBBpcVQReItu357JJcXU9x15RHi6L42HM+8EwXoUKJhN2O906x
	 WZ4FtMyd0c4adMdwsrzTZjemHJqIj3eGRYbL/jj47fsM+ZudD+jXYc9VeVisrcFVsLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h+vOahla;
	arc=none smtp.remote-ip=91.218.175.216
Received: from mta0.migadu.com (out-216.mta0.migadu.com [91.218.175.216])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0756606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0756606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=h+vOahla
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KCnwmkEmE9KD+1uFCSdTtPwWMIkmIPWrLfClVd8l0gw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795477099; v=1; x=1796081899;
 b=h+vOahlaZkMdgpDYidUpIwjsHicWag3Mewva9AX2VKl3C49BKp3E42cQBeG3vS+OrLTus249
 iUYwbI/3FVve7whjU5mP/0X+AP6/pcMl7GneqlQqtgO1LTuu344+NGkTV2P0HE2uHuIlKpA7g5t
 ZvBBvpFSVjmD6pxxtFfkGHkY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 3cd6d033670d05d8;
	Mon, 23 Nov 2026 23:38:19 +0000
X-Mizu-Trace-ID: 3cd6d033670d05d8
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 00:38:18 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>, Zong-Zhe Yang <kevin_yang@realtek.com>,
 Tzu-En Huang <tehuang@realtek.com>, Yan-Hsuan Chuang <yhchuang@realtek.com>,
 Kalle Valo <kvalo@kernel.org>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v4_3/4=5D_wifi=3A_rtw88=3A_do_not_d?=
 =?US-ASCII?Q?rop_stations_when_collecting_them_for_an_iteration?=
In-Reply-To: <20261121191528.591334-4-mehmet.fide@gmail.com>
References: <20261121191528.591334-1-mehmet.fide@gmail.com> <20261121191528.591334-4-mehmet.fide@gmail.com>
Message-ID: <96E13482-9087-4201-9CDA-B86A2DCE2CA8@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On November 21, 2026 8:15:27 PM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>rtw_iterate_stas() allocates an entry with GFP_ATOMIC for each station
>it collects, and skips the station when that fails. Once the firmware
>recovery resets the stations through it (next patch), a skipped station
>keeps its TX queues on rtwdev->txqs, and rtw_txq_init() later
>reinitializes a list node that is still linked.
>
>Link the stations through a list node in struct rtw_sta_info instead.
>All callers hold rtwdev->mutex and no iterator collects again, so one
>node per station is enough.
>
>Skip stations without si->vif. A station moved back from ASSOC to AUTH
>has gone through rtw_sta_remove() but is still found by the atomic
>iterator, and mac80211 can free it without calling the driver before
>the iterator runs.
>
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/4EE3D95E-988D-4514-9849-9546CD49D8E9@linux.dev/
>Fixes: 78d5bf925f30 ("wifi: rtw88: iterate over vif/sta list non-atomically")
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
