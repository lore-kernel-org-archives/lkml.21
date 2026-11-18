Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007419;
	b=0GfgKef9SlZK6F9T2nYG4E9LCsHTe2XmJT3AqzD83epSplv8wTUVpDItiUv4gIFQxopJ
	 IsDiev5dGKyKWSPv5wklYjncvZ1YC2I8h/3Ll+HDmjtrm5ZPnJu2IY9XtXVg5+ybJNkPF
	 g90Ky3hEUgV0smAjZJ11tnQuVrlE/XTtcBwuJ0F2Tl/uPzOErSecpQZWiP/UQF2vo+2MN
	 LEL54d5aN2KkItM6gCo07clmabgXQ3EwoXiv20cT4DDr7qFAFBr/0yKjSn+pcCCLh88ke
	 yZt1HOEd+skXwYQwPr+Waozu3jAF0yOH5bRgXGI+FC/5nDugOnQ5ZQ+B/rkv1n56xDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007419;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0srCo02Rm2nrJ/OxbxU648DIjt9+9+y8xYU1XDIc31U=;
	b=JxOtXard2i9L9gvfG3a61ML2V1nCB/vhmipJ9RkQZuM3ahIL53fAFTVyTa1/gy9JUBbq
	 RtiGiJqBPOyuAFOw761ynNw8HHvdjq2reky4EgVbMVi45iC4EShx5UOllNklXpd0pivMH
	 Fz01Fzb/xlmGA1/UxinYZEcq/EPI0S/SOFuTvfa1lwGLFNbFmaaepwuuuCn8rRw1K9SlK
	 SRheEYyHjEf9fIObdDxyAdo8liTk0N24CvQ2GJfizocm7J1gzxmsFuBBksmzFYfFJcv+d
	 NLul75xXPf7ondpuYuHl6ukEPXaWrY9tVVa9CY9rBAQATFjoIYKHcdTuiT87z1UII5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YD3gNHqD;
	arc=none smtp.remote-ip=95.215.58.130
Received: from mta1.migadu.com (out-130.mta1.migadu.com [95.215.58.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0E606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 13:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE0E606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=YD3gNHqD
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0srCo02Rm2nrJ/OxbxU648DIjt9+9+y8xYU1XDIc31U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795007417; v=1; x=1795612217;
 b=YD3gNHqDAt7O9xw69FpTwnhbQ9nurw0+UG1P7T6+t65AG5xibrVy9MCwbfvSYwh4ORfXUOS4
 80om+eAjciyuZkA9ygg72Xy1MSSEwARNomXv16LOv1KCXZbyCIkJRmwfMt/SW+fo8XqVRrmC6N0
 n+iaTbullvmEoNSSIA67ZD7A=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 918bc269a2179b39;
	Wed, 18 Nov 2026 13:10:15 +0000
X-Mizu-Trace-ID: 918bc269a2179b39
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 14:10:10 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Po-Hao Huang <phhuang@realtek.com>, Kalle Valo <kvalo@kernel.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next=5D_wifi=3A_rtw88=3A_find_?=
 =?US-ASCII?Q?an_associated_station_without_allocating?=
In-Reply-To: <20261118104738.2020747-1-mehmet.fide@gmail.com>
References: <20261118104738.2020747-1-mehmet.fide@gmail.com>
Message-ID: <82D0B44A-7B20-4564-A368-5C834ADC6F8D@linux.dev>
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

On November 18, 2026 11:47:38 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
>rtw_core_check_sta_active() collects the interfaces with
>rtw_iterate_vifs(), which allocates an entry per interface with
>GFP_ATOMIC and skips the interface when that fails. A station skipped
>this way counts as not active: on BSS_CHANGED_BSSID and in
>rtw_ops_stop_ap() rtw_clear_op_chan() then drops the operating channel
>saved for it, and a later hardware scan no longer goes back to that
>channel between the channels it scans.
>
>Both callers hold the wiphy mutex. Walk the active interfaces with
>for_each_active_interface(), which does not allocate.
>
>Fixes: 96fbb84de4ff ("wifi: rtw88: handle station mode concurrent scan with AP mode")
>Reported-by: Luka Gejak <luka.gejak@linux.dev>
>Closes: https://lore.kernel.org/linux-wireless/9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev/
>Suggested-by: Ping-Ke Shih <pkshih@realtek.com>
>Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
>---
>

Looks good to me,

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
