Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285665;
	b=FKxYXsD+ea+UD3bwe2eqTfuG5suWWXYb0pOdo7cn01wlW27MNHbdTl9wF0RKME8AtrfV
	 BHN16LcPubBr82JrcGGO4SLN0gJaq5TGLH3pcezOe9otx3dYPuoxyXRaayXHX3mvGSES3
	 oeoX1Q1Iz57vuz9voqINzcRrCFsisRV0nLTldAjt+ymnf5G8ws8seAO1GhaTaerJHy10R
	 H2P1teGOzu/Ga4AOrpN/EghyJWsZDzbjqmR3ZpviNJT7Det0EzXr53nAWI83PwM8kQHEy
	 63gZJNiE5mS7yPu2Lp9JrXavzUzb20Ck/UVc56qPo2cwOHy/Xz+EZ/P6KYQ6xHTQneQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
	b=xUiBE6wKQZ4zA27x/xuK+MWviYmubqvFSPhiWRKBGh227GOS2Wg56zh47DOBQwYs8g/z
	 hj+o0MMP97dyXuD4F2VMcWSf6RSmmqO3mWeoU1L4spi7CuU8I5Kmldw67YUWilsfC41T4
	 1QuTjnnV2VH7GFMiWoS2X833cPiurWwyay6qjFC9ZZPVw32tNBlVZhR4gAivmtitAy2Yp
	 pq6Z+jkqBoQqYbTtKAXQbby4HSM81t7PKiH0iVXZ5fuUSLQPl8OFZOomX2OmZI6oP0kMq
	 Ej6ZEWIPiQxHTiaFvDuO6bSmjEKRNrZga5yPl0V0UZNXZczvSlyiqJ3oi/yExBOMBqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXUPGsQL;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99713606A32A
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:27:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99713606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zXUPGsQL
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb609d9bf4so4111425e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285663; x=1795890463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
        b=zXUPGsQLwEGN+zZGgQ9AjMgexb5EbRMM7gpPxJDdobyNUS9iZUN8Y6df7qz0H/enee
         3ctFakO8DuPpa4olem5aEcHDy5tiXtIqRlvedpEFh4EYARvvHUS6rpLYqSCReB33iCYX
         MW6CfgOn//FkYORRt+7zqN92XcOhaHIW8Mpp6RAQmUPOgJ3RqyDgzpzITQGb7U6bCIRs
         1TPtoujMNEMP0grI7TvSvT96s0We++NnfDI4HQ92oLQEfo6sztp0uAWjLEObFUc/WV2g
         W7YdhrpI9uD9ooGQLISmiiQM9U5XT+Fmyf5JlOKFpmHP7zdAVWGPJ8t8TsvOMb+FE/QN
         V+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285663; x=1795890463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A2IquiPKClvkTsJZo5KHXsqR+OsKvLJ31mZtX/9MM+0=;
        b=YT/QERDUPJYzM6ZPWiVcakqRfhd3WYy0flTxtOAusxMT2P5z1jY34CSRXDATjzKlgq
         W7dCSClvl+0qeq0sgbl12HSpfnGQlW0OTTJ36nDmiW1b3H9G8lkuwnCOFivhoiMllKND
         K1ofzJngktkhR5LbhgKtL54vEKI6UDvIgCcLcJcWT4uA/PTsJSi5nX3gkYzntOdFKPg1
         mEbrmo/Z/NqjYdt2ePYKyEHUvqR5FFMJTzOvpKZRxiTAkfm/6ioQGTx7j1jX3WCJ11qy
         nycuoAMZeUmoyJhnMoxFqoBQQh5Knw14Ru+6a+5rKtISW33qpVL6IpsrMlMu8o/YLwze
         xuNg==
X-Forwarded-Encrypted: i=1; AL+hErF09gn/JmUZsO8qEzsClg8uQuGMbZBeFh8dU4/igod7j9bsrCdFSxS2SQ+kd63JOK5v2fHi2o4WKjvVskw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PgM7bZWcjxMS/eISdMxxoyzIUouwiSDEAdBETb05BcYFUAlKn
	e0fPFbtaoy2zTXhPa71FUqyO6g5IfhI3U0BqzU1iDBfU1EwBixSalqrl
X-Gm-Gg: AZFdTZdWRL1lLl1d+foLlrEFFdTthMM6XYz5Q7jE1a2djSKW626aiDTGtHsVtOgdlhx
	Km0hbQ0pabtwEiZ6GS6THiLV+kT543dxss9aMnXIG8PzDphQL4WgF1t6cNooJoO1mAC1G3YeyrB
	cw3MuoP9TMZ1Z66hgXIa7BL+d17d4WCs0yhIxSTKlfyzurYOwYkc9acyTwnvyesT0gnG6yZeTN4
	kgVgJAfdxJL/mxUU1r/zP08UxY72hDzTv1+xXFbDBJZfyrf3DxkmQ1ImUNHYnDsjyqf79atSXsz
	/NSFAGR7W3O1kvZt7mmkyIwzEv2/IbeGgikOrcv9/d3ncxYpYj2QTaHKUlHj0lA7oBZ/BthmrUc
	e+UsOVsuT5pgHeRu4h052u4eINSU5vDiliSjhtWbryOfPGkYFfltd6H35Ku3diqZVobRuKZ6r/D
	ZfmRYE1p567707GkmUhE4PA09OqA5bg98890pDAncxdseRBrkdDpz2ZaTen9YvNIAbz2erlEHKP
	nK+yNL3cJ4r9y9aNodr9sQkmJczmWBs3HRGB8UN4VE2iBZAS3E2UrA++/mq4l5iiW8SkskKCtKk
	QvlF/b51B5MGbM9fwVxLkAdw5OpH9aV82YonNPxWgnbRIeZ+AXDbbIRsXesfFnQRYGq8hg==
X-Received: by 2002:a05:6000:2505:b0:492:3672:eea5 with SMTP id ffacd0b85a97d-4ababda5370mr15300169f8f.2.1795285662799;
        Sat, 21 Nov 2026 10:27:42 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:42 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v5 2/3] selftests: net: veth: propagate channel-check failures to exit status
Date: Sat, 21 Nov 2026 19:22:16 +0100
Message-ID: <20261121182217.4609-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..7a2bbed0263e7 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
-- 
2.43.0

