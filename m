Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441815;
	b=jGGD3a277CGmvfGbDQrQxX7dsIoY8UPlqYLKPat9X99Puu/LWRgYTK1+zlRJk0hILNQY
	 uaKkvuI0/kGIWE9TCmsDG8WrgNStktxzS7t9B97GWwf2uqnkgQrh3eRfPAiIEUqlfza0W
	 JzMkT+xtM9DKqgeSX/+UCp0SlRYp91JTansGYEr95rNjaQMmHn1ZWESUOJ4QiZ4Y439Y9
	 9FkiU7vs+1iHzWvjrjwXCvxjjrkUAzj7evdvbXix5XI1EpHAVjPlwjJuKciVJFKAmIB52
	 k89yepbDiNUqPWGD1JUmbV/N85XFE+tbs5MGFUNpnNzAgtp02kUuWxIGgZElIPWgRMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
	b=0D5+EUxzZ18b2IKuUXq/ajhCfDqequqlDFH6WYPOTWqYSoFOAL7fDJiWUip0sB4Cx3S2
	 AISOW+rkD0BrwTdm51uLUCGJDWem7SF2tPQqRWg0I5fwFcVZsSp0w6oKAT4mSOCEJ8W5z
	 9qfIo3hRs/QY4v8xf+AFqVMpD70UPvw4NtFfJ7bqANbQMV2bX9qz0X59va2S7dPj5jrqC
	 yu/5Ke7+6rzv0sS/en07sdI5RJxYMjeu3u/6d5e+aBCIzvDezbXDyCJhjSAeOsMPSw34R
	 ID8h+HKExNjVC1FttkTti7k6pL1pQitxYN6O71lAtde9JmkJ7y2zwHEG5NDTDa6BzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RmovXTm3;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B1B606A681
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:50:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B1B606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=RmovXTm3
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6ba1e22ff4dso3667254a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795441814; x=1796046614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
        b=RmovXTm3yp0/TLqARLhMhmLh4CGdmjeVEHYVnbBhSuhN0ZcZmgmvAj8cQR+WTNev+l
         sER9u4Q54v7YbgeqZviRJKPczKQxCz7J2A2hjkaFNkF29cvcyBNiPEFL46f0vw234XwH
         0A8r7BJRfuCcUpw1E4MoC1vzpMYkPzOBTwNZbIl4oZQrfva3r4JrI9FgTxJZruzkyVmP
         HIR68rHtHZstVmJ9r4wXDoZWtf1FmJtW3iCo0dK6Le5IR2VjMozMF+yQpQXIK3hmC14+
         eMHH6iQk+zIuyFyqKaYsCKfgTDr+ofr/XBHUZ3iCySlFCWN7PotFzre4g35xB5vZ4c9s
         W/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795441814; x=1796046614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=17KYrYGAaWICw+QBtHzm1gh/PguJ64qmvrlG7WKJrow=;
        b=J5Mn9gMkDuuI7KBicvNCD/4XKOyQB83LraPZbMYu9k4qd6HG4YXissjNlmepP2JUH0
         6vgLQAuDArbIGjxJJ8QBnQstVZQLyFCZh78VPV+3z/1mpmqlG6kBLoVRku0cubzPx9Yo
         /BXdyCjEJEWXW4e8pcNBXqN7Sq3K3a1xydEBqETT2YnYEjtc1FW/sTMHN4QdAqtEq+G3
         Oce10LGksgU5jy1oQjCAjKWHHOUkLkSyjA3hLMUOOZRRiYBF2Llu5rXY6jlzJd6+SF6n
         I1TOAycXwdE9xO14zULWrT0Mgq0/oWKmjWuLOMBrxJVWp70MHFbkd5nG2hLVG93Ze96s
         hu8w==
X-Forwarded-Encrypted: i=1; AL+hErF0Jc5tTkg0oTr93yQacKYe4CMCziOOkaDFX4G7BCYB6FV5aG/ihadl88FgNvEpm6UbTPdlRD3pWK3kBZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y/HqyrqNGcTUscJKkZ8vf58tLtgr7vh2qWFFZL8jD97+2zdk+
	noFE5RT0yOt0jWnwbcBTQr4FwwWnXWwsnjJ0MUpPL3hwRTbkv+AxiZ2pIK7kKwma0A==
X-Gm-Gg: AZFdTZd1zYYqJ5hitecxCB/CasY05fFrE7in2HjciIb2NJGs6e22NsxY8mRiwdTQ22l
	+t5clHEf7v2+NMI/9dajP1AsuyzwUu+cCUafrCWaJr0FEEZOMnbQcd9BFQx0OYwLeq0b2T31ntu
	KW2ahbCFbtRkiVN5ioFZrYi39qmPu0gbnL4/fXrU/DrQxfo2KGoOJQE0iPQy1hYdS1YzXJYpNut
	CDcNwfvRNet8gNB/RJH6fgyPNv87miPUJgF31QXDV6bJFgOc90YNVRmFtGz6PZxxPwqywtLEOjd
	OmbFigQhuQhnoD9rWEh0NhClcSM6WNb78TX47BYIm4iAsukuHrqRp7AB2aQvPV21vwAr3TSaZvP
	lO1oo/QpN4g6NwGAHyGGwW324wF3jIkPlUuSaob0WXooNwMcXpM7nNffVUM+WErxk4z2zDiv3MQ
	MRrDVX+pK2JaRPDlbb5nr3a+u1uurHB0VY1Dk73LnV6xY66VUEpN+no68MyhqjrS7/Ex/Atx3qG
	weEghpRTRhS1tYIuCVq9k9tkDDyQUxxkwekg+Tas+4BOjjl7eQb3gWDNqT6RBX96I17/F0TfGbh
	lKNV/YUqQsCFY9eyRaKr9CWXFAWrUopC2c5D9S6SzTuz/pFxVzaCaoytC4BMbAhwuIZ7FjRs+Qe
	3A68pUubgZXn3en3/zIqOJvhbqfLihbkShtpAPgYj+HfOcBs9IVZDuv/SEUtUFdfFGUIzrNooJU
	tsqWnPrf4IxV+p9u8c+J3TgaNAOALSp8k4CkGnlFiFk8XTe5OuKiqRgYwvmbTvDVN80Kb7tDamV
	k7UWPhY7JWnFRKZQi1ovqkVe/eLsREDJsQk1p+NuF5O1Z/qW4Y6QpzzeByvshhJLxGURMfVqTF3
	yClE/mcoIE1w9QuA0kfz30qZHrU2iZVv7hB67aGk2rJVZZHbiCp/D09U4vmZWuvezhtxkRwUZw=
	=
X-Received: by 2002:a05:6402:1f0b:b0:6b5:87cb:d8ce with SMTP id 4fb4d7f45d1cf-6ba37edf001mr8720032a12.41.1795441813634;
        Mon, 23 Nov 2026 05:50:13 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247012000e9a6b19fb24a0d13.dip0.t-ipconnect.de. [2003:f2:4701:2000:e9a6:b19f:b24a:d13])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8a4sm5357732a12.21.2026.11.23.05.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:50:13 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Jeff Johnson <jjohnson@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	P Praneesh <praneesh.p@oss.qualcomm.com>,
	Sriram R <sriram.ramachandran@oss.qualcomm.com>,
	Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
	Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
	Sathishkumar Muruganandam <quic_murugana@quicinc.com>,
	Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
	Balamurugan Selvarajan <quic_bselvara@quicinc.com>,
	Venkateswara Naralasetty <quic_vnaralas@quicinc.com>,
	Govindaraj Saminathan <quic_gsamin@quicinc.com>,
	Wen Gong <quic_wgong@quicinc.com>,
	Carl Huang <quic_cjhuang@quicinc.com>,
	John Crispin <john@phrozen.org>,
	Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
	Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [RFC PATCH ath-next 2/3] wifi: mac80211: tell a driver the netdev a station's 802.3 frames reach
Date: Mon, 23 Nov 2026 14:50:09 +0100
Message-ID: <20261123135010.721107-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123135010.721107-1-julius@bairaktaris.de>
References: <20261123135010.721107-1-julius@bairaktaris.de>
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

A driver that merges the received frames of a station as GRO on the
netdev would has to know that netdev: whether GRO is on there, whether
it builds frame lists, and which host sockets it looks up. The netdev
is not the vif's for a station on an AP_VLAN interface, and only
mac80211 knows which one the frames reach: the device of the station's
fast_rx, which __ieee80211_rx_handle_8023() delivers them to and drops
them without.

Add ieee80211_sta_rx_netdev(), which returns that device under RCU, or
NULL while the station has no fast_rx.

Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/mac80211.h | 17 +++++++++++++++++
 net/mac80211/rx.c      |  9 +++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 76ff86ff9974..3c6784ad62c7 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -5472,6 +5472,23 @@ void ieee80211_rx_napi(struct ieee80211_hw *hw,
 		       struct ieee80211_link_sta *link_sta,
 		       struct sk_buff *skb, struct napi_struct *napi);
 
+/**
+ * ieee80211_sta_rx_netdev - the netdev the 802.3 frames of a station reach
+ * @sta: the station
+ *
+ * A frame the driver hands over with %RX_FLAG_8023 for @sta enters the stack
+ * on this netdev: the station's AP_VLAN interface if it is on one, else the
+ * interface of its vif. A driver that prepares such frames for the receive
+ * path of the netdev, as merging them the way its GRO would, reads the
+ * netdev's settings from it.
+ *
+ * Must be called under RCU; the netdev may be used until the read side
+ * critical section ends.
+ *
+ * Return: the netdev, or %NULL while frames of @sta take no 802.3 path.
+ */
+struct net_device *ieee80211_sta_rx_netdev(struct ieee80211_sta *sta);
+
 /**
  * ieee80211_rx - receive frame
  *
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index fd7dbd4b0611..397f5fc71a1b 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5310,6 +5310,15 @@ static bool ieee80211_prepare_and_rx_handle(struct ieee80211_rx_data *rx,
 	return true;
 }
 
+struct net_device *ieee80211_sta_rx_netdev(struct ieee80211_sta *pubsta)
+{
+	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
+	struct ieee80211_fast_rx *fast_rx = rcu_dereference(sta->fast_rx);
+
+	return fast_rx ? fast_rx->dev : NULL;
+}
+EXPORT_SYMBOL(ieee80211_sta_rx_netdev);
+
 static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 				       struct ieee80211_link_sta *link_pubsta,
 				       struct sk_buff *skb,
-- 
2.53.0

