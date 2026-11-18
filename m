Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.204
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995716;
	b=slXpERZpMuMiaUBHDpRnkzJxcqTsjHhKBBnuUqjCGR2bResDCl1Bw+ct0j7X1t0gYLn8
	 RkkTedilnq1XL3uwig/Wwsj0Mgyn8bowoDES9xMlWH10u/GbqGwdCurZQK0S5A9HtrpPi
	 n9241TlJNodIVT+dLw0M1TVDKfHeaS+3Ia6246fCSrCOUivsKG8STlp8wRKooFzOAAT/T
	 3sjJ0h1VDOMfruLPDra+GJeSuy4f9FTlnTN5o17Q3BP4gWKVaRH3QwUFSwxzTfw8lmjkO
	 JNduUHNAGgqSstKLqA2vDmp7qD20G+Eowge6X/IMKYhnn5EKy/V+VOWODsYff7qr9zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995716;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=68aYgIeK1NKoIkVCvJO3EdG3lTe27tI30PqKaRlN81M=;
	b=PPCS0hUSlKWIqojkI46/YbbHnRumnmVgTrktKilbuB8EgNiVcobaYKm9G6z4utDJR7dK
	 TCBM2YKUwIf7CNJV6UM5ugEGqfMwKE/O7LrKwtYhgFMZZUwnx2YzYHSsVKAGSiGLHFIxE
	 AVck3CXyKYWWxg1VnrGewLXxyRxnKt/plRoEMBEA37eaNUnUdgnqsWB0D5FHzyE1m+GlI
	 s/oxY3+95+45ctXVKxgd5OSnlHEVfNKh8DaIqVcXYRXtMQeWUBZvm5xvtgBa2fM4ulzL5
	 qk3cypMNYEZ9OY4xwRtYqq540eqyq1BnbSyY2vusUfvvauWFqN28rfmbqJsGz+7joow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G1k8HRgc;
	arc=none smtp.remote-ip=95.215.58.204
Received: from mta1.migadu.com (out-204.mta1.migadu.com [95.215.58.204])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E35606A320
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E35606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G1k8HRgc
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tUna76zVsD0TwVxAAHPWMoClAbc3fRYk8TKbzG4ej/U=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794995713; v=1; x=1795600513;
 b=G1k8HRgcQ535AESZxlbEXe9eIwLIk6EykMHrB6y15u3D53ijIWAmz3WNJ1sBtqaFj559V2Ka
 JkRyzNgPsmOGFR6QxApJuPZP//MnrBbIncV5uBOuNSP+foeEcxQeTx2CGfogVEFSKWrBBO71q+o
 zd53CDzq2nQ79ULM0zSGoSq8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9701b37f731648ef;
	Wed, 18 Nov 2026 09:55:11 +0000
X-Mizu-Trace-ID: 9701b37f731648ef
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 10:55:10 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Mehmet Fide <mehmet.fide@gmail.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev> <20261118083328.1984956-1-mehmet.fide@gmail.com> <d55a09e0accd42f39f476d3abba1cdca@realtek.com>
Message-ID: <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev>
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

On November 18, 2026 10:14:17 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Mehmet Fide <mehmet.fide@gmail.com> wrote:
>> > I think the presence check is better fixed in
>> > rtw_core_check_sta_active(). Its callback only reads interface state,
>so
>> > could it use an atomic interface iterator without allocating entries?
>> 
>> Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
>> there. The check is older than this series: since commit 96fbb84de4ff
>> ("wifi: rtw88: handle station mode concurrent scan with AP mode") a
>> failed allocation also makes rtw_clear_op_chan() drop the operating
>> channel of an associated station, on BSS_CHANGED_BSSID and in
>> rtw_ops_stop_ap().
>> 
>> Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
>> a patch before this one in v13?
>
>I think rtw_core_check_sta_active() is used under wiphy lock, we can
>migrate to use for_each_active_interface() with lockdep_assert_wiphy()
>as a separate patch.
>

Works for me.

Best regards,
Luka Gejak
