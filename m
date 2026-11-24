Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513825;
	b=3n8bVKHs5WSGLMotrU4W/Abee2muRWwUnAfQ47GFyvOOeW5/MezzXv7J6aW8FOejWDOM
	 QxsdBSK9XeyOKdnTQRju3NPF9gzLE8yHXLid/fIl0L5vN7wsvD4N2gyludLYfHitT+keI
	 zTpQLv0w2sZ43xDHuK5UoMoKtUjJuLX1iGShabGWuGlJwQLX9C0xYVtORonBinyl/UaCR
	 93sEGgb3w2bGnNb3SnMOlGQ2lrI0YYf7kPTarA9n44vNUFRkPi0pZ61EIT5jIP/B3z/Ol
	 J1Cjq9xIBNe9qrD+hWvTmP0o7EgZ7UnYzaDYdWcuN8pJzE36mr1yQP+tIytSB2exegQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513825;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=aGhEi+IyQdF5gBxDdknepkYqidje0CePqZBCdoQ3XsE=;
	b=QMUxdL5KIt+b431GBG3TGHNYTuWWSzPqoTC3ZZNPSxHgDidEg8g7TWkVmsSpKSWl3ypk
	 PqGsFmU9YPcVGkXcTyzN3HHU0Q2kGeAQJ2WwEVqQXQ4k+EbjJR4xmOk60a7OAUezuYMew
	 k2F2hnvEtOz4cOv047pfPNqxFeig+x7bVokeO4yggTkrEN65TVOp7ohbH/MN+AMLfddqL
	 2XBUqnV08sbq1Ns0F19ks67FmJvrpWbpeNQrHpEibDFNgQHClzUZX6SpRcWzh9AcOX7oH
	 xaqrmgcD0IYxyhsiOb5Q2TSMKJ2fSTcouZM536zCG2NyWqs+KY9MZQ+DzKk0HR8jzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wn+sRIr+;
	arc=none smtp.remote-ip=91.218.175.49
Received: from mta0.migadu.com (unknown [91.218.175.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4C3606A697
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:50:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD4C3606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=wn+sRIr+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=FiG9VWiR/ZS7Vrcvdj9BhVJMQAumBhIBzaBch+xxR8w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795513822; v=1; x=1796118622;
 b=wn+sRIr+/N/OM+i4Ruy85pwG732hl6djvXezlv1HKetKfgMfiBNdwOYMZxMfLgMtKuHiMcOw
 aMhJq7jhQejGGhNAIiW3L3SgRKFDLRyEBQAOL2jvJ9diYd7vpRoPU4EHrlMh2zCZ32XAeWLtjRT
 iWqrsHoTTaxZOYoXChogTENQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a959c6f6fda30b52;
	Tue, 24 Nov 2026 09:50:21 +0000
X-Mizu-Trace-ID: a959c6f6fda30b52
X-Migadu-Flow: FLOW_OUT
Date: Tue, 24 Nov 2026 10:50:18 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ping-Ke Shih <pkshih@realtek.com>, Mehmet Fide <mehmet.fide@gmail.com>
CC: Bitterblue Smith <rtl8821cerfe2@gmail.com>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mehmet.fide@screeningeagle.com" <mehmet.fide@screeningeagle.com>
Subject: =?US-ASCII?Q?RE=3A_=5BPATCH_rtw-next_v14_3/3=5D_wifi=3A_rtw88=3A_?=
 =?US-ASCII?Q?time_the_countdown_downloads_from_the_TBTT?=
In-Reply-To: <b5309523db4f437ebcbdaf1c99fc7a96@realtek.com>
References: <20261124002437.213112-2-luka.gejak@linux.dev> <20261124083156.206506-1-mehmet.fide@gmail.com> <b5309523db4f437ebcbdaf1c99fc7a96@realtek.com>
Message-ID: <D39E7CD2-EE74-485F-94B2-C942D5A23117@linux.dev>
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

On November 24, 2026 10:09:56 AM GMT+01:00, Ping-Ke Shih
<pkshih@realtek.com> wrote:
>Hi Mehmet,
>
>Mehmet Fide <mehmet.fide@gmail.com> wrote:
>> Hi Luka,
>> 
>> > Could the wait for the safe part of the interval use a finer timer, or
>> > could we limit CSA to intervals the timer can reliably handle?
>> 
>> Agreed for short intervals with HZ=100. A finer timer would not help
>> much on USB, where the download itself takes 6 to 17 ms. At 100 TU no
>> count repeats (model with HZ=100, rig with HZ=250). If Ping-Ke wants, a
>> minimum interval check can be a separate patch.
>
>In my opinion, we can just fix the real case you encountered, and yes
>we can think about the different HZ cases in detail. However, we don't 
>need to consider too many corner cases, which spend a lot of time, 
>but actually never happen. Sometime in the future, if it happens,
>we can spin another patch to fix it. No need a perfect patch. 
>

Makes sense, I will take that into account for future.

Best regards,
Luka Gejak
