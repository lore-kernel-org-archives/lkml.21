Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199255;
	b=BTUBreHPHE29w2iRKlJBCwdPE8einbpyFYbKMnl6lNsIFb1zgjYijGv7C1hFUelgANL2
	 mKOs9Mlcv67bRgNdiiJuVOl+QdD0/rIwHWvZg87VcwUXzAUBYuaVYau5zp+psilysmzfd
	 oCfc+X7Nacr9BhqfoqH0WZv8Yz9tVoF4O5Cte0VWQPraDS8YIA4cv1p0958b+nsZDoHCz
	 TBJgq4e/+WgqtSv1nm0SL5N0qTbYEFDvAPn7mzXXjwskUJUwjB/DuuLP6FXu7wmNaL+Lu
	 psOTm9iA81Ig0R+BL+q/BzphIRlOhaT7CFYoM/JW2rwF22JpZAnuuNHjprrUmtjiBAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GIz15JgjnK5uTt8nm2/0a0kIukD9hLXTrgL/HU55oaU=;
	b=hkiAP5MGcdz52rYhVJMdAz1Sts96GFacp9svWET0nPr9dVnK1Sh5Ms0tYJz0Pb1Bp45n
	 qL8Ek+XENZ0pEWYvxTYRpuFvX9z304oL4OOcYEvyHJOMVx5arERoMxQ4pHg6rsfi/j7Zp
	 uO3hMmY9NRbIdwcEh3ZC+nLmTuhkdS7tihPtCbkxEdFv8WYSQOI06al27T+QHoTNSSEeN
	 JoEvfX49+ca8TvfPYxUJx1LXZFmVzAiUKrsrGfI9m1hTXFta5FLaizYJW7OPnEjxlAHNE
	 6C12rNrobZzY5pqhwTTU8Dubt+lXIV7+kSQPeOVub/JZByCGCi/Eyi4GLXTkBkIuTwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEegjj8z;
	arc=none smtp.remote-ip=209.85.222.173
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C66D606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 18:27:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C66D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IEegjj8z
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-949657a20d7so147130585a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 10:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199254; x=1795804054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIz15JgjnK5uTt8nm2/0a0kIukD9hLXTrgL/HU55oaU=;
        b=IEegjj8z97epEN0jfTn7VXYwngNMROpE2hFS1s8D7vzRzDq7JD/qHN8DSMBKXQpmQd
         THS5XLRBZo8uRS6rwBUFjPt+lx5+ArEMg9+rGiK+9M7RLRm8ePYiGZvhQ6X+zfX/lJbR
         hkPMb75itGmvPPO04re8FXrrrMBUn4Uu49IyDGqjtK8uBoTkByGEMGZoP+8lJSoBnLhH
         vrBREKw2V17TToN7eh4F7sSxjzgIZA3o7JSCisDpmhUm7wQ0opbf/LroA9vN69jQMRsH
         JiVU5QoXYUyR/2CHUuct+heqtcXa/SCIoLuNLtl0X09dpK1xy703+A42R4JFQ7m21mOT
         QYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199254; x=1795804054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIz15JgjnK5uTt8nm2/0a0kIukD9hLXTrgL/HU55oaU=;
        b=UmRhNKsM8QwZYWQ7xe16HqQqDqrpPtjkeqLuQzD5YCEziyxLmBuzFxSInyvUbVI43C
         WmkvxQvydE44/eZepJy/oyKxeq91hrOa3kv3HTpNU5NTmTkrficyEbh/+pNjhcCw6xZI
         UTiydIoiyW4NmKkyke71XGeZ5kC/PA/ibNF6P5kUROxXx2X3qk0/Xkqvgs8mQPqgPncx
         C0tifESNObitP6Q1ruP3D4XAggk51Lxe1SXWnXruuMqhRyjvix6MsjnAgBrUVdzN7Z0l
         gTaJ0s5CHf3/lISyxfrptRluWH5zVvsmp7rIa4P/UuAmW6L6m0aztPxZDa4zukpmKVFJ
         zNxg==
X-Forwarded-Encrypted: i=1; AL+hErEDblI4lJ6pTkt+9YTqd3hGk+JvuuAEv39th8DFvqi15sbYlnhXaOh1Vis2NdYvB9Ihq+vVOM410BURAQI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BV1XDOpagm0pUXc4eCNsyROrYCwD13PHCUU4tp7goSiJ1kPxO
	4HG0ORbvTuifDsdBe9o6baw2wOm9Msr2QNiJN/o4W8ZrWaHZrfhejrnA
X-Gm-Gg: AYBFou0MzfPXX6UnniNhwn0alPFJgzBnr7mo8fIAvwPG4Yty2nXff9UvbuaHwf8WxXW
	hv/VcfORwf0cigf0lcT1hKM2Yqeovxl2vTJyxSHEeAiZO0z7oZQ/RkBPQ9jQFYvhHDSAtkRYzPf
	G1es9Tb4x4aoPMF6cZT3N1xJ0x8tQEYNOIWsdw15URyOiZYJOmtJRbeyArbs/UOO/sd8ro/JJuy
	RBo4ng+ZZpw48ctpsBZJH3fDd/WOMno2yJbCS2Y8J9iqouNsJY2OqqkGBtJ23fOO21EQhQ+ePsW
	GviCZ+z6hIw7Tb/w7wB9x+siSvyqDhilCZMWvyYUPYtk0t1qdYIeWABgC/MmuejSRsDVrBihjUi
	zYWKZropptu4Zrk45ja9DQLa5AnyqoJIj8AiRtoRNuztnb3tqve+UO9yguTXGJMLeG7Z1HJatTr
	B1yJ5UyHV4RgJd8IiDrlBif5qo6Nd0w5Ese4ui0Dy7j3PuflFqw1GMvRUMP1rvAgYhI9G90s9/q
	+Z6+Fj8P9PGZJH7Tdcc4ew47t2ZJZtjJDsSY/vBi8uSFhMIK4DLDzYOaj7FHt1R5ZaPIkZlw5Jd
	xV89wbwOLioFqJ/p5c8NyQPgCmSAkH4uAmOrZKu1xdyZFCAc8Pkgl2qF
X-Received: by 2002:a05:620a:28d6:b0:949:7656:ca0a with SMTP id af79cd13be357-949ba99ab2fmr687727585a.35.1795199254069;
        Fri, 20 Nov 2026 10:27:34 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb4219c4sm253599985a.41.2026.11.20.10.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:27:33 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Luka Gejak <luka.gejak@linux.dev>,
	Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>,
	Tzu-En Huang <tehuang@realtek.com>,
	Yan-Hsuan Chuang <yhchuang@realtek.com>,
	Kalle Valo <kvalo@kernel.org>,
	Stanislaw Gruszka <sgruszka@redhat.com>,
	Brian Norris <briannorris@chromium.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v3 3/5] wifi: rtw88: do not drop stations when collecting them for an iteration
Date: Fri, 20 Nov 2026 19:27:30 +0100
Message-ID: <20261120182730.467748-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <0f2520cdfcb86395317a39637bd0b535844e34b2@linux.dev>
References: 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Luka,

> Thanks for reproducing this. I was looking at 0bdc579dbfc2, which
> already has b719e9bced93 clearing si->vif in rtw_sta_remove().

Right, my test tree was older than that commit, so what I wrote about
rtw_sta_remove() was wrong.

> Could you rebase v4 on rtw-next and keep the si->vif check in
> rtw_collect_sta_iter()? That should cover the case you reproduced.

Yes. On rtw-next 0bdc579dbfc2 with v3, the client was collected with
si->vif NULL and was gone from mac80211 after the held collection in 2
of 3 runs; in the third the watchdog did not collect it in time. With
the check in v4 it was skipped in 3 of 4 runs. In the fourth the
collection came before the client went back to AUTH, and the removal
waited for it.

Mehmet
