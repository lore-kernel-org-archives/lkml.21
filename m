Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795281808;
	b=UPoUkaLYAICayndwnKkiDlQNYOFwrl69h/2Q3KAiTCw1n5G6ruTx59DmeXcPWDnZc1Zc
	 FeqokNmOZ9XfqjMCMgHVnWxRDR8cmXxBdzbzDHgUVQsQp2NVuD0hi1frJSgAICN539Xqe
	 Ra9aV76T9OQl4G8wC3gU0AADJ+GEYowPyt7NT3mqw1VbhRgvQoQIk5esiz8PsyiFu4WNp
	 7EP7gtmKFMP+5P97eN3s+T+lqYabdwdJTV7TjMrSUFGIXYej05R61hg3sWYtGNF0s47Q3
	 olJ0IxgyptL2qRGwUMa7xT7gmkNQIFAKceZzv0Mp4j+nvnUe+WMkocCgE2msjYKaSAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795281808;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=A0co6D3pA2qw7YPiyyMMIlKC8VVSD5A9Jz422WbS0Bo=;
	b=GppUq+r22YQb+mCHD1NTn4c9o1MAXBgr/Qo2KdUVUB7NjJ5KFM+NHeq18hVO3EzD8+BL
	 6OQlM8KASkjz869s6rB0OrJVxorW4tjyWx6S8puBbecxmThURaDgVuYi9OOHIT5YOhmq7
	 nFz+y5EaKjnlGgsqQ0tkjRqSUBMUZF3ioGpzQQ1eeat/Z0rGAfw62S5Vq2om+nJnZQijQ
	 Wb65G5A3mlBghEMRakafLvrsBtjDa2fdAkVwq6CbDdpt8DIunTw+oCYtdsbwqu9Fw4gOj
	 uwqEhwk4L9aJAY2TBdsEW9NYpOAP4MsADdqGMTLVqW75xUmB10m7ykeGQFZS9wUwQgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8LmpFBe;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927C8606A320
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 17:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927C8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P8LmpFBe
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-33fb4680717so5242927eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 09:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795281808; x=1795886608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0co6D3pA2qw7YPiyyMMIlKC8VVSD5A9Jz422WbS0Bo=;
        b=P8LmpFBeeEHcocflIPBIlS1K9w6pTlbbXxxF7rE+383oIBdTofSXp75DxlWBqIC+TJ
         xDrN23DlA7Nj544SQyBZaMWQvuIxEv2xKdV+fmylyy/8wDTKBon7ajKNGjyUiUwRe6zD
         U5/K8xllqUiZ/yQDDwGJnWVEKHle89afY+SACk/iJIfVKTeUD3ddBgc9zwJTZvJ0jCjC
         ct29Fvv7B+KhPwIZ9BDxcGEk/7IDUJoj0zSXwAjuai5Kqt/JR6Trw9EGA3NWM5ko5HNX
         aTDfE1b40TpFlFU8oqwlqHxL3Qq1hT3xbePp7/sKIH9yyMYLAqIiiu4DaELWMcvIqcT3
         CPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795281808; x=1795886608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A0co6D3pA2qw7YPiyyMMIlKC8VVSD5A9Jz422WbS0Bo=;
        b=uk37tL2NH/o1Jnc0HR/Gus6uSeoDexO3FDpigOactd04LWPSnnjZEul4mi32Dh1Nq6
         GviuXLkshTGkPjHw2kbI8wjMSLGy2AKetA01lcs7pF7UUx7yQ8YlDhjKVzkJ1cA/KStY
         2IzR0IDkY6YfNfGYeMY0H8RKNKUEmCmlqjxwm8I5y9vBMaz6x+5VUpy1qdMbumujemEG
         zF7xY7cIzD1elwWj3ng473X/+36O5YsTiPA3Pnm26hdeFJY6Bn+dsOIOCwX162Zyc7TH
         8HLdmrfw2YHSTX7VfTWuU4+l7mjMrLHOxAhuFLk6IJ+OblUXcScNWDDPaEeOclpR/m0J
         u6Sg==
X-Forwarded-Encrypted: i=1; AL+hErErjjm45JB482qOP0D93Z4AoqS3WKkIq1SatgbxU5TRckMdsoo/Mbcu4qA2wvqQ4s2BncgRt0DdcQS5hRQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q21Kmk6jVEwbCcapTegGFq94hhcVttRMq+O6spoyKnpKZgwAw
	gjKxEAVYe7QnbZ2gJmCkGeTfoYo83CYkNd0AeDfmskYNoCl66dU0/wq4
X-Gm-Gg: AZFdTZcnqrwtvsX2Nyw+cgRiERAzzDKvlaI8l9o4+ZFGr36CXmCmJPcxbyO7W/8fTXE
	0cwTUxVmQ+koa1DTi/+cFCfIauuLTcu2LkidLD8NjXoHsguVK55XPwzZHgF0VF7M/3z62AMTEab
	VyKAJQGZ/XKAZCQVOuPMZxMoXw42GU1+ri3leu4yBOn46EQ6gw28cNPLKAaLIqRv1t1xr15DeWf
	6PfmnGYDsXkgVAI0s1OGXKFCRa6VV2WHhsZGoFMMOQVKV47dLRYYQMSrlVuQbnMr8Frz/R9AtDp
	n+IOZpT6+NPSRtPNpLce7D/brIS8YDpa3VdsGbDI7Nav/VcehtPDDwTSJq879IbV2714bv9Xe6x
	dSv9+Rbdv+L1rTeTjghatHa5vFiI/9qqiwqf7xg/up2oQI/x2mGc4A8bQ1/U9HIlghnhsm+4OYR
	dvEZg+Thrt9aDujnc37p230+6uJL8VpYYbGCRpoNic96Py6N8G0BmHOvuawODX/Jra64l/lY2NT
	PNaHumGsjEj9gM/kI4+vbWRwxSM+1Xb/r8S521Z60rwubL0d9HATAqfFbXFp2uloUnFxDSBEoE3
	qhnCuYf6Y1j8yU0PhlHibA/aK7LDKR2IkWCm
X-Received: by 2002:a05:7301:fd16:b0:385:8744:658f with SMTP id 5a478bee46e88-3858753a876mr6679805eec.28.1795281807535;
        Sat, 21 Nov 2026 09:23:27 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([2001:e60:8509:ba6c:4c23:efbc:89e:50d9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm18360832eec.7.2026.11.21.09.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:23:27 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 5/6] Input: aw86927 - handle the AW8693X play and boost register layout
Date: Sun, 22 Nov 2026 02:23:26 +0900
Message-ID: <20261121172326.846-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261117052112.32527-6-xiaqinghuan@mail.ustc.edu.cn>
References: <20261117052112.32527-1-xiaqinghuan@mail.ustc.edu.cn> <20261117052112.32527-6-xiaqinghuan@mail.ustc.edu.cn>
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

On Tue, 17 Nov 2026 13:21:11 +0800, Qianhui Xu wrote:
> AW86937 and AW86938 keep the same register map as the AW86927 but move
> two bits and invert the stop handshake:

Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with two AW86937
(chip ID 0x9370), compatible "awinic,aw86937", "awinic,aw86927".
Both probe and a force-feedback rumble on each drives the matching motor,
before and after s2idle.

Tested-by: Joonhoe Kim <26rote@gmail.com> # Lenovo Y700 Gen 5 (TB323FU)
