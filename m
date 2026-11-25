Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647335;
	b=IZoPJzHBOfkZx/5OYWs/fOw8NpHrW05bmpsg6lb8iHROc3NR7OeG+ACba9A2up/visXX
	 ptCegROMFGCSDaiDzE6YisdW7FZk3wlHqiWltrz18oPu3M52hMJ4FK+qxjSW7WPZW4N0w
	 tbH5rSv3XWrZahEYEXpBo8CGAaKBeHqjqmgyhydBzbmo2dnpz4sPAO6IXra2xh6andK0y
	 lP+xIzhkzBD4TguhC+lOB0xuEUZEMwsBILcySj/uzecGKvK6v5W3ona0Wx47knvZfo9GM
	 IwdZMWF8XLCxcm68nrApDxIv4NW2r4ja8q4OYNfaGLaHuFF/lkL2rv5SSUPjxKC8i5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647335;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:CC:Subject:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cfXZ14QND3WjKYNC9UCJvXr/veM+vkfDQNZABOALCP4=;
	b=wTITLcuT+vs8NW49FKzayeBTnCflIfZqspzA1lCbzooxj9Se50cz+lwZ0+Wcw6vgjwbd
	 ymEhGzCVW4MZvZEM4X+rutWjErbyiEi5Ii8ovTCvhmCNha/YDcKZDIUk9sS6MXiGGxaKZ
	 YsrYd/AFVgCi2BggO9H8PAyfb4dNW5T1KqL//9z11wxt8uzHqSVPGi6Owd8G4uSwNDuxC
	 CHoEGOwd2tqrQ3TlkWsW5nCxA+9s62RFyw3QQcpoDTVgRTkhYJpJS3DD3IYzHAyKRn4FB
	 3heUizLTeU0+MBXcOztTH/4d8F6DYgPV88Qs8ZjyASj7wr98r9tYHFOktVW5HCv7qJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WWmlRhUn;
	arc=none smtp.remote-ip=91.218.175.237
Received: from mta0.migadu.com (out-237.mta0.migadu.com [91.218.175.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF42606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 22:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF42606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WWmlRhUn
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=cfXZ14QND3WjKYNC9UCJvXr/veM+vkfDQNZABOALCP4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795647332; v=1; x=1796252132;
 b=WWmlRhUn6xe0vTgkxoBAOWpO1QOxP0ZznWOwK1yi6mD6VN1a1SRzfgfTHrkw3M4ZF4T+u9N5
 l+aPiQ9YnIcx6KPrOYBNDeSQ7snS0olZrOPB9vL3qgKDQdcMZlDxOYZnjzVp3tgVgQ2Ovs2xcSg
 JqZmDAxskDya642HuafX6kBM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b2ba880aa252d78;
	Wed, 25 Nov 2026 22:55:25 +0000
X-Mizu-Trace-ID: 1b2ba880aa252d78
X-Migadu-Flow: FLOW_OUT
Date: Wed, 25 Nov 2026 23:55:20 +0100
From: Luka Gejak <luka.gejak@linux.dev>
To: Ahmet Zeren <niko3x@proton.me>
CC: Ahmet Zeren via B4 Relay <devnull+niko3x.proton.me@kernel.org>,
 Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
 Bitterblue Smith <rtl8821cerfe2@gmail.com>, linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFT_rtw-next_1/2=5D_wifi=3A_rtw88=3A_use?=
 =?US-ASCII?Q?_the_rate=2C_bandwidth_and_GI_of_injected_frames?=
In-Reply-To: <ecNmU3PXiWoHo5Kp9n39tXmMq1iJCEzT2J_TrZH2xipIKP9jtEdDBIYUKdyBWvKCRLekdJgXgo50awp_oEjhE1KlfT6e1ELZT9abegQ85L0=@proton.me>
References: <20261124-b4-rtw88-inject-v1-0-f7457e496924@proton.me> <20261124-b4-rtw88-inject-v1-1-f7457e496924@proton.me> <8E47D781-B1FF-4B2F-B0EA-AABA130E2778@linux.dev> <ecNmU3PXiWoHo5Kp9n39tXmMq1iJCEzT2J_TrZH2xipIKP9jtEdDBIYUKdyBWvKCRLekdJgXgo50awp_oEjhE1KlfT6e1ELZT9abegQ85L0=@proton.me>
Message-ID: <28ED0B12-9712-45BA-BF90-8D7392C5D504@linux.dev>
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

On November 25, 2026 11:34:49 PM GMT+01:00, Ahmet Zeren <niko3x@proton.me>
wrote:
>
>Hi Luka,
>
>Thanks for looking at it.
>
>> Do we also need DATA_SC when the requested width is narrower than the
>> channel?
>
>You may be right, I'm not sure. rtw_set_channel_mac() writes
>REG_DATA_SC on every channel change, with the 20 MHz primary and on an
>80 MHz channel, the 40 MHz half that contains the primary; and the
>normal rtw88 TX paths leave DATA_SC at zero. My guess is that the MAC
>uses that register then, but I can't tell whether that still holds
>with USE_RATE set without hardware.
>
>If you can run that test (a 40 MHz frame on an 80 MHz channel, with the
>primary channel in each half), that would settle it. If it goes out on
>the wrong half I'll add DATA_SC to the descriptor.
>

I will test it in the morning and let you know the results. I would hold
off v2 until then.

Best regards,
Luka Gejak
