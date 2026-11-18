Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.92
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794993269;
	b=HNvwiVLWUW6BHlT+WQuqxCqO2vQfUUd7vfZp0XpRH18r8EaEnTyHt5+bS+wy5PXg506V
	 Dgr8QWNdfBy3kg+FBw8QJfUpi3sGHMSRRDKbK/GjsvX8Mcgrq/Rw+Y4N4wVQIFOXaInfH
	 t3hAItiaEVztcQWWecqh8h+Lp9cKEsXA1JqqofAg0r6EjdrTGQQaLUm0k4ZkL5q5tFsXd
	 9GEvAtoaBVBB+FYsTiXaE9KcjljUY5D+sb6aUebfbh+fwUzwU0zCY2ziNSbKCDtcV9iLg
	 IfqC01psIOYF5XbM4UUqN2xUgi+p4KPypAOodmcFWh+QI6+Q2DFhPAt81nOh8p5nWPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794993269;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=wrWsmpFUEsR3lRS9lv6ubqR22/udzNI+pJsuck8/tuw=;
	b=Uzk1eC+9VDSWLW/MfxaqtB49E4C/Wb6bCjNFDx4Fmsk9ICWXumQD1ac3if4x7cdB4dej
	 iaJ9fPtHeaoDgaMOI0tem0pRqNf2vD8H217WjXTPKRiEb4P3VMGUgpDPkLhdQCg6LkPEW
	 ekgmASeDcev2uLRSn2AHXRDZWRgheElkhYzwpvttzuIc2U2P9JKZ4SfcLoCZ8Q7etjW+w
	 NS4c9ULa7eLfm32v/yYPmiitbf7azCTC893Qj0EbmTkGGdmj78eiEayOzJW+/MD5Rd+bh
	 Kn8igc/kgeElRyVnvDGPug/Suj8gVSMQSDDibFgLAeI8urGsXBWykVjiurLWRAKTfdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="tg/AuriT";
	arc=none smtp.remote-ip=91.218.175.92
Received: from mta0.migadu.com (out-92.mta0.migadu.com [91.218.175.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3F6606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D3F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tg/AuriT
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wrWsmpFUEsR3lRS9lv6ubqR22/udzNI+pJsuck8/tuw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794993267; v=1; x=1795598067;
 b=tg/AuriTVhjeVsvcsQpXTRXG7nvT4FcnGsUbW9qWJzH5iEQI+XOqRzq68YbyEgKPLVAUsrGX
 QZdsOdV5JTQvXNd5hDbjja0JKGBit3VGxynuWoPm3q6eJsQSJ27f1ULdrIYqtW8qGIvkxuS3H3K
 tN8JRolSIG9Elr5Y7ZigSj4k=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6f0aaf4e757ca185;
	Wed, 18 Nov 2026 09:14:27 +0000
X-Mizu-Trace-ID: 6f0aaf4e757ca185
X-Migadu-Flow: FLOW_OUT
Date: Wed, 18 Nov 2026 10:14:24 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Mehmet Fide <mehmet.fide@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <20261118083328.1984956-1-mehmet.fide@gmail.com>
References:  <20261118083328.1984956-1-mehmet.fide@gmail.com>
Message-ID: <FCDF8941-48C3-420B-AC7A-598406EADCF4@linux.dev>
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

On November 18, 2026 9:33:28 AM GMT+01:00, Mehmet Fide
<mehmet.fide@gmail.com> wrote:
>Hi Luka,
>
>> I think the presence check is better fixed in
>> rtw_core_check_sta_active(). Its callback only reads interface state, so
>> could it use an atomic interface iterator without allocating entries?
>
>Right, the callback does not sleep, so rtw_iterate_vifs_atomic() works
>there. The check is older than this series: since commit 96fbb84de4ff
>("wifi: rtw88: handle station mode concurrent scan with AP mode") a
>failed allocation also makes rtw_clear_op_chan() drop the operating
>channel of an associated station, on BSS_CHANGED_BSSID and in
>rtw_ops_stop_ap().
>
>Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or as
>a patch before this one in v13?
>
>Mehmet
>

I am ok with either, so as far as I am concerned do whatever is easier to
you.

Best regards,
Luka Gejak
