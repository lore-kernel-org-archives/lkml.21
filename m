Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794960716;
	b=2T5OPV9zMytDa/m/C97BpdIamn+McKmhRHCzaE66+On6MsYXYr3fbirPpjtarX0qIEp+
	 ibyPVHhoo53dBgu/VBflh73wpCRRJQ8ZjGbom5klB23KQ75ZtEZjovMgT6qvgZU6u29ox
	 R/bGAwr1iLse7SaKqP0YQpojebeMQnd/CRktXFEo27e9U3qww7t0BQJmVyDaujJ5M2XHR
	 rYTbaIgMWHAxXeDI7wzBDgTtPJEju2/p9cYdj7yfyN1hF+6pQ8k6/0rn4B9383edsDIOr
	 H0gL24gc+7+rwdKXSusr8HJEx0gBl3frRqMeNaIgp70JCg+zjpc6d2/67zQ3DtpOnOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794960716;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=K1OKgTmowWWdLoH03PEEFydtagLAJC60tXnR+xAM2B8=;
	b=IDwdY/oG2tXMkuX+/Z0kd1A1t1hSqZCZCDeOdOLVa33EaeuG7RcMwFiSoCIjLDw5zDzz
	 ZWhfYd4ZDwJO2ErpR0SPM/PQV/Ow2s+IOb/Azcvytzbun+bXDKtKD1+1HW7NxYKEN/Gk+
	 bQQwbyAnPlH8658bIIl+SSoJNfR3kIQdaiInc5CfOVIfiHUZKL5scUklyy+g+au2/BCnd
	 YorDyxL5b93/+HegANOTEmwWH5FZ7x8f7oC0i8enEIf18Pu0m9rO2YryPFwY9q6M622fo
	 kgY3EU5TjbVMy2zQLMOLZLuQBwuGsyRXOvbg/VzgrohvdBFUO68ohezYLtscfS4X9Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kv6wylKU;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E5E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17E5E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kv6wylKU
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3282db206d3so1128617eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794960715; x=1795565515; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K1OKgTmowWWdLoH03PEEFydtagLAJC60tXnR+xAM2B8=;
        b=kv6wylKU2VHkJ8xiBIxSVenR0XyETQ7NqRhBG9gI4RzrmX5YfY9cxrrAWzDX05etf2
         pKjenujUDWe+zjI1wsmSocPt+b4qtXservyrgYcvkE5igaIiHgcG2LasnhAoibe0v9MY
         FAxCWujggVvRSqdRoh7mM/vsrRK2TozDpgzu4Cf95BPKstvYNSVsTXmZUtGJqc9iL96u
         Egmg9Vq8Th/3QsmWRwmXC1JBJnLR04UGpU6zUoB280ylKNFlh/tJntu3GQbrfq/m3bZA
         v+3TRpOllkNoFQ1p4BF482PvQQvvoDplhtCxHI0A6L3vml2Q438rvdBbmMsvzovHpWc5
         dkmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794960715; x=1795565515;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1OKgTmowWWdLoH03PEEFydtagLAJC60tXnR+xAM2B8=;
        b=qvWJtQdBIzprY+3uULcUNHhjqciTraAVECr55VDd9EQK/Hshuar5qhC6aX7n47Sh3M
         IogY4BK8Hzoqt+r/9ib/yrgJzsVmbv7yRmFdpgHG2ToIq8MGwzOt5wfK4zPn7XA21lVv
         MVd1lNpJ2mwQ+PsS27MzOn3S6H0zN8d/tiB8IHBmOMFlu7umqLg7pe/5CnsjK2K8z10E
         ESQvh+dtAE+IyEVn9GwoBcScEiJH+BeD2JmlfsEhBUipTtQSTgjhxus2MjpCus0YQaNt
         S5wAANZvoD2NZDRA4yJ5yIFRS1Bkzz2AsJA2NHtwmb/6uktbNRrWCDK6icdRzC1nRSnF
         MiqQ==
X-Forwarded-Encrypted: i=1; AL+hErGCKeXIaN9UJ+gqOQejQuHHAqPkx2Q+ltfvXTqRZk8/VxkJe0CTNBojkhiyZtSC3/WgirOhGkUgRvg1Buw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9730ei7V25inElcD66B/KGzT1bwIAJ7jdIWNWRJgE/gfB2OYsR
	OyT3EtnhmknCOpp94Ezxf+rj0igOI1BX5UQIYIhvj196+cIrgNFDBwIc
X-Gm-Gg: AZFdTZcvenH9iPDMhRF9oQJ1z4RtnuwB+3xinMKEEtI5E1IgnZcgoE+EmlPtjExsdMN
	K52mMJQ1CiMK4HOXmHZz9nSbmrkIBMWVPOjURdvnueOG6bWEZJX76O5cjclFIzi39uxgXHGzqJE
	oY89WEfSYER8q6ovP4z6DY//6nWNjp5wJVT9NNHMQ+i7wgo37nFhKNkHhBjnQosbclDg79J9IWA
	639cGdroK8EQjZTvzaUfPOFB9BtCsIZSgafxPfDa9NVJiQuLwVVEJ89NbPMATAb5XQOo5uxH356
	D3z1GlwDEK3v66rb0+0Qm2Y58JjiEH5OkzQ4FaT8c4cZluKg44/8dK2yu2v1m8LahPhu9kf+ZOr
	2CiVMsHD350zT+NAxcNLoxDuRzknhfIFV9nSuYBazBE1b80bxzOGsNIoONsVeukvQpG7h+etkHI
	INnewpZNd1xlylPa8LVKVnRU2fr18AvBLb3V0sM9fzxydNXy287PDT3rmcgEeF5AuWShg/bq0vW
	mAx5n/1BM5keiN5r4Ie08iT5GRTOCWoG7SQhMvhPT4gg2GdzEmGOxtnBnELP0vdGb0CSPWy/dNU
	b+xUT80aj9LNnJVw9u92/xhbVhAkClJVAM2JbpjjyJGaOxQgDBCwOtWlDuC1IvtwkDrm9z15
X-Received: by 2002:a05:7300:ae1c:b0:372:eab:d700 with SMTP id 5a478bee46e88-3827d71fd36mr1150388eec.1.1794960714122;
        Tue, 17 Nov 2026 16:11:54 -0800 (PST)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a72e52easm1344552eec.17.2026.11.17.16.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:11:53 -0800 (PST)
From: Henry Zhang <henryzhang62@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com
Cc: mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	henryzhang62@gmail.com
Subject: Re: [PATCH v4 3/5] drm/vc4: dsi: Rate-limit error interrupt messages
Date: Tue, 17 Nov 2026 16:11:15 -0800
Message-ID: <20261118001115.1299354-1-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261028164539.3471833-4-henryzhang62@gmail.com>
References: <20261028164539.3471833-1-henryzhang62@gmail.com> <20261028164539.3471833-4-henryzhang62@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dave gave his Reviewed-by on v3 2/4, which I missed when sending v4;
the patch is unchanged from v3:

https://lore.kernel.org/r/CAPY8ntCBPwyZkM=F0_0EQOjMRqKO2Do_Cwum24ZGoWEofr7ETw@mail.gmail.com

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
