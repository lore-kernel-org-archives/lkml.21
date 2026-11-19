Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099390;
	b=lTUXDaXPhx7h3tomO6khM5/41FVvaT5fWyBaciUfK5e1Gvr2cNuKMCG/i/1RrJRnlIiw
	 ISoCmamrOPB85k5Z5+26q9vlShs9mlpDiW5ZmX5h7yT+jiiwl+eOYHTcnAO1ayYGCvOIz
	 RFb0/Es1Gtso90Cvy5DRmTPrlVeDjAPoFvkvFxLoSQknDpCh3yrl6Vla+ID+TvMDI5kDC
	 DHoStXZvt0o+RnETR9QOU7Rt4Qh3MlhVxHU5aaxwUH+NKovBqSsXwQV+NNW5PmJVqmlr5
	 iGB6dT5uLBhQo7MoU8hEId+J5+KNWHSkHj2TAedxADFNfzA9Xo9+s9iVWk2Wrb6mxyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
	b=LMEctANm+sRdywnJlb9fUaseVb7XGFMjdbv4tGuOCbp+ExtW++8yxoaJSeafdHOYd5vl
	 KXZXFQa6GO5l4JiqNvkZi86wkzkxiZIv9Mo8hzPRYVGSak8pFK1JCQ3vgKVt1GRnKhTKw
	 rldx76cEqWolO0ss9QHooHt2G6PeaXCx2wtm1A9tZt4GTzlKqFDvY563oah6Ct0ztGzNO
	 XVETdSWu5UbJI/EX8nkIpyvCuGNeQ1v3MI5Ph2KD+J7Js6H8ik+SbeX3qU3MZyfTbGDI4
	 1+m1BtRJuvZny4te3Nev+O651BkPP7WguIUiF8uBdljEUnsfL6PHiH85X9dFVVfDsyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCfnoQPq;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E532360A2634
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E532360A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCfnoQPq
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b3a05f8b5bso2920859c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:43:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795099389; x=1795704189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
        b=GCfnoQPqg+rCDFqYxBpm9AKziIf+db5ejrjN3XzIAVXwywCajnXzzh4eEwiI/gLxIZ
         p3UK5+dBJyUS386omtr4Clr/kiVXlfjqXMJ0glNBhMIymhCnApZybKHV4TvVXOh3Nv3u
         SpL3s6Jqd2BcoXEaaK72PMwWGlRZAogU1UNYitXhG997WzgzRAjMgEuQRqOtrT1xkf5u
         2RpdW2VwHA0Kvp9GEcqpN6VByZQ/nN5N24VOXuNR2hdxyy/eEAXMAn1gYbVTaHxUcXiy
         piaRAyK351lHRur5sX87av2ea7Afg0SQbGMaGezLO3veV16PwqNXXK4r34aNEIyyESz6
         U54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795099389; x=1795704189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiNGMOZ+T2aYXndxp6WNW2Z7eC3xgYW0cACgi8Pfxp8=;
        b=YIcpmFehT6jrldMuUVlfFV85h06tBHgIqEwCTNNIUkrjKLQHfsY/vLZt50dosQqxiT
         iXyaJYBWIYu4Jf0pJ7VmZM6g8NpvHaESPK9cb8gv0sBEagMoEQNvBx2wKc+z6H3+SfBA
         w4OQI3lp9OxQKmPPSwxUVmzEi7V07Xzk2iMuy4GyKtpYuGQTWs0hpS5ZQM1shq3SEVnt
         50b0DflIrAwHdj/Erks5ayMpLeeJhCKXaBDTn1WfL5XqUjogfd32k+rvr8tVdTptNCEs
         PPTD/6w9g1E48g0Xv5OBandUeMKjIREoZOJ1eAlDM0KdOTz3/biyf/fRRbBhiro5wm4C
         4sRA==
X-Forwarded-Encrypted: i=1; AL+hErF73hqqIr1VTj5o9/BVyyzmSMMZJI/u6BPfh6eYV8lDy1b0IdUCxZ2SNXqkkh6SZLfgJK3DU7IvnwbTI/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pQUY9J3eIqZcBLdNW86iGZH8ZOsygDgPZ8K/VSOBBYEIM+UMF
	1oM6rYTC2mO/hPLXamlplwXqhk8Vacx2zOpKqeE/B210pG5rsrU+GUfN
X-Gm-Gg: AZFdTZcDiRkHlp6dGO+ViWcCDLpDDGjlANwyzLeplJpnMQh3VaZfMJZqYqyOd2hNX+t
	dTjneg7KknHbiiRInOxCGaocvqYgyWOHPiPTfyLN9pQ7HxWGO+nCdQsDbGW8Cn6klY2O4p8KKDE
	bs0HwOr+E27zzznDTKTvgkOfiIQ7nwhVGMXQLydhZm5yiB9aD7hPkbTexBXJL3JwE4EvM3+WIyg
	K3EYd9qTueaO5eAvwAOWPZzngKGTh0hv6Tzv8K5cBGEEnm3oLEA90jvDrDGUNBNBvQ26u/NVQhU
	6M7F3OkiladnAPcVVspeJoCWpFyWhvduQzuI3luDXtLSRXS/FlVCz5eaH2rssVaKxuPzBCTOVEk
	IUqKnlb+Oap+yHl4gBEKMtpxnOUym1XS11JtzZcmUrF6gEaLe0uzOhxEbsfvUfly2LB76RXxr4d
	rl0DD8EZCBBe5pp9mwYlEcQxXcGttrVb8/O+k4SJXHUY3u4/aT4lvi7Aw5zef8mpbX82rLrZEn/
	zskLrYSfRuQUSmHE0Rnzq2WmyAH2Wg8fsRSjojO07vSR4+ZxYldsD2OklWGwpt0uRoNVdwusInC
	gSbknd0Lrp2CqUIE3lptIUH5GvNY67SghwlBdb78lAaCENZOrQ==
X-Received: by 2002:a05:7300:cf98:b0:382:7375:1306 with SMTP id 5a478bee46e88-38280a38654mr5978419eec.14.1795099388796;
        Thu, 19 Nov 2026 06:43:08 -0800 (PST)
Received: from localhost.localdomain ([112.170.44.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe733dsm16682848eec.16.2026.11.19.06.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:43:08 -0800 (PST)
From: Junyoung Jang <graypanda.inzag@gmail.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Junyoung Jang <graypanda.inzag@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Gwanhyun Lee <gwanhyunlee@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net v3 4/4] selftests: net: check padded vnet hdr_len in tun and tap
Date: Thu, 19 Nov 2026 23:42:39 +0900
Message-ID: <20261119144241.360238-5-graypanda.inzag@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119144241.360238-1-graypanda.inzag@gmail.com>
References: <20261119144241.360238-1-graypanda.inzag@gmail.com>
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

Add tun and macvtap write tests with a 512-byte virtio header and a
14-byte Ethernet frame. A hdr_len of 256 must fail with -EINVAL
because it exceeds the post-padding payload. A zero hdr_len must
continue to accept the same valid frame.

These tests exercise the common header parser through both drivers.
On the unpatched kernel, each oversized hdr_len test accepts the
packet instead of rejecting it.

In x86-64 QEMU, the patched kernel passed all 105 tun and five tap
selftests, including the new cases.

Co-developed-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Gwanhyun Lee <gwanhyunlee@gmail.com>
Signed-off-by: Junyoung Jang <graypanda.inzag@gmail.com>
---
 tools/testing/selftests/net/tap.c | 29 +++++++++++++++++++++++++++++
 tools/testing/selftests/net/tun.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/tools/testing/selftests/net/tap.c b/tools/testing/selftests/net/tap.c
index a0c9418132c8..bf5d36cf73c9 100644
--- a/tools/testing/selftests/net/tap.c
+++ b/tools/testing/selftests/net/tap.c
@@ -425,4 +425,33 @@ TEST_F(tap, test_packet_crash_tap_invalid_eth_proto)
 	ASSERT_EQ(errno, EINVAL);
 }
 
+TEST_F(tap, padded_hdr_len_exceeds_payload)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	struct virtio_net_hdr *vh = (void *)pkt;
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	vh->hdr_len = 256;
+	build_eth(pkt + hdr_size, ETH_P_IP);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_F(tap, padded_hdr_len_zero)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	build_eth(pkt + hdr_size, ETH_P_IP);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, sizeof(pkt));
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/net/tun.c b/tools/testing/selftests/net/tun.c
index 34de2580e32e..525fd588d916 100644
--- a/tools/testing/selftests/net/tun.c
+++ b/tools/testing/selftests/net/tun.c
@@ -683,6 +683,37 @@ TEST_F(tun_vnet_gso, vlan_tcpv4_gso_no_csum_64k)
 	ASSERT_EQ(ret, len);
 }
 
+TEST_F(tun_vnet_gso, padded_hdr_len_exceeds_payload)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	struct virtio_net_hdr *vh = (void *)pkt;
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	vh->hdr_len = 256;
+	build_eth(pkt + hdr_size, ETH_P_IP, param_hwaddr_outer_src,
+		  param_hwaddr_outer_dst);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, -1);
+	ASSERT_EQ(errno, EINVAL);
+}
+
+TEST_F(tun_vnet_gso, padded_hdr_len_zero)
+{
+	const int hdr_size = 512;
+	uint8_t pkt[512 + ETH_HLEN] = { 0 };
+	ssize_t ret;
+
+	ASSERT_EQ(ioctl(self->fd, TUNSETVNETHDRSZ, &hdr_size), 0);
+	build_eth(pkt + hdr_size, ETH_P_IP, param_hwaddr_outer_src,
+		  param_hwaddr_outer_dst);
+
+	ret = write(self->fd, pkt, sizeof(pkt));
+	ASSERT_EQ(ret, sizeof(pkt));
+}
+
 FIXTURE(tun_vnet_udptnl)
 {
 	char ifname[IFNAMSIZ];
-- 
2.43.0

