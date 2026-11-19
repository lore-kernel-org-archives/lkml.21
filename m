Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.126
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063364;
	b=hBhN70TGSivPr5k+q+YYbxPzdyOnAQ3bhyj0c/Lzi++cI3LC8TzwUh1mIbdb0d0jY1cp
	 QcmHyvF2WhNGJym5/bdW2XbxZi/cLdSd8HPNb4IniQSgK8TKa1v0+O8FTFsDqZw2I9u/O
	 AyPpWyMdBu42BHtr6keN2rQENGVV1g1jLA7TxnGiRPTEoHh/0ktPNq6CiOfW5vozaqlXx
	 devQ8BE+Mo+Cn31nGNBPH8g1HeVj3V0yqAK1oKyx1gm0HVkXBtvoKImxZEv57EINdbQ62
	 TDB1ri894jZ7z7FYk221DKKTbi5pbHY19xSnVdkW6R/ho0/sggy9pCDWLFK/dIu8auQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063364;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Zk9JOF8svvT2HGi6J4q/vmjJvEVsfSmVzwmFPVVSGu8=;
	b=J3NEsDFkQcvivIoF2we+atqSdh7ekrs93v1KCsElJdw9p3gPZwd3tdovhX/YMgyH+2xp
	 p+h0p6WMXPsrI+kKQ4B0rSR2GvcQuo5pVtFxRvzBUqrXtL4Bs1bLqdGnemA6ds2gAZXJP
	 89sJQWwwmqwTSPcdNTJKx4dzgNcuwvejTOQPZjJP87tNLy5G5k0s0DEWAiR7NPbeF4Itb
	 TK/yEfSbfzJiEsQKDcWEeyyXK++U8OWQ6VFdrsYPgOQL7mQd4ewIH6Otfd9KLbCTJswwv
	 DWf0LVWFajVEVcEOCqcgcFUKX6R90c58DReS/9DnFBr5zHVqQ1rbmKYj/QQ8hXVyMag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M2VOWUXp;
	arc=none smtp.remote-ip=95.215.58.126
Received: from mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B92606A325
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 04:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7B92606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=M2VOWUXp
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=igL+GNlLs9K0x6iR7lEuZqZJTnk1fFTDBfsrbV2F6BA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795063357; v=1; x=1795668157;
 b=M2VOWUXpPJnwVtCfzN0nibrL7VEs4vLjKEPv6CgfHPFRzd8dDIinY5WpvNcOZcfl1Gp94Ajs
 L1VNacjNR2h2rBdJUFpPH+jRUVcdyVZgWgX9Z54YNCSsXvrNk8DotHWdHcVTtP/ZZ4X6i2KoYZW
 /3sFoRI/pbijrr4+po+FTAyY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 68d595ee228be766;
	Thu, 19 Nov 2026 04:42:36 +0000
X-Mizu-Trace-ID: 68d595ee228be766
X-Migadu-Flow: FLOW_OUT
Date: Thu, 19 Nov 2026 05:42:32 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Mehmet Fide <mehmet.fide@gmail.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v12_2/3=5D_wifi=3A_rt?=
 =?US-ASCII?Q?w88=3A_support_channel_switch_in_AP_mode?=
In-Reply-To: <9340ef0716924e229396aa1b595aa458@realtek.com>
References: <9BC4FC13-5723-4711-9798-11E3C285C7F1@linux.dev> <20261118083328.1984956-1-mehmet.fide@gmail.com> <d55a09e0accd42f39f476d3abba1cdca@realtek.com> <658FDA93-1E44-45D3-BBAA-37FBBAF9954A@linux.dev> <9340ef0716924e229396aa1b595aa458@realtek.com>
Message-ID: <7485BFDD-E895-4A73-AB29-8F3CB4712115@linux.dev>
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

On November 19, 2026 1:51:06 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Luka Gejak <luka.gejak@linux.dev> wrote:
>> On November 18, 2026 10:14:17 AM GMT+01:00, Ping-Ke Shih
>> <pkshih@realtek.com> wrote:
>> >Mehmet Fide <mehmet.fide@gmail.com> wrote:
>> >> > I think the presence check is better fixed in
>> >> > rtw_core_check_sta_active(). Its callback only reads interface
>state,
>> >so
>> >> > could it use an atomic interface iterator without allocating
>entries?
>> >>
>> >> Right, the callback does not sleep, so rtw_iterate_vifs_atomic()
>works
>> >> there. The check is older than this series: since commit 96fbb84de4ff
>> >> ("wifi: rtw88: handle station mode concurrent scan with AP mode") a
>> >> failed allocation also makes rtw_clear_op_chan() drop the operating
>> >> channel of an associated station, on BSS_CHANGED_BSSID and in
>> >> rtw_ops_stop_ap().
>> >>
>> >> Ping-Ke, Luka: would you take that as a separate fix for rtw-next, or
>as
>> >> a patch before this one in v13?
>> >
>> >I think rtw_core_check_sta_active() is used under wiphy lock, we can
>> >migrate to use for_each_active_interface() with lockdep_assert_wiphy()
>> >as a separate patch.
>> >
>> 
>> Works for me.
>
>Think more about failing to allocate. I suppose kernel will throw out
>a OOM message, so we can just handle the return NULL pointer to prevent
>crash. To ensure function still works as normal under OOM situation,
>it is not so easy. I guess we need to add many "special conditions",
>and driver becomes hard to read. 
>
>So, my opinion is to do our best to keep function work under OOM.
>No need to ensure everything work perfect. 

I agree. I think the benefit of handling an allocation failure needs to
justify the extra complexity. I'll keep that in mind in future reviews.

>For this case, it is not too hard to avoid the OOM case, so I agree
>the change. But we don't always need to handle the case found by LLM.
>

Do you mind explaining which LLM are you referring to? Perhaps sashiko?

Best regards,
Luka Gejak
