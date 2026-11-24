Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556463;
	b=LOoH9eZRCdP2dmgJxGFJrHhr52BegiqJLzWQh/CWJ9PvjnWx+P0BDaiU51Te2d5rh21B
	 XFk9O3UTecokcSHDk5C5j3KjpiikIAsrIgCzBObHOBGAoAtloMewIQStwSCNuXVP0f4Or
	 WrCnqbzwnLYoe9ZreqVblH9zPmRWoXAlBIw5dZfizYKK6+1AG9pMYT51lXHOUjLdKJWKS
	 DzQge38hqzB/DnEHO6Rty3+nQVyi+UNwXSW4lZgkHwyJ+9SHc4NT5dvmt3m/YvRLMepOy
	 ZKm9AAIcSLgMbtwABCvcuiG5vl8wKrATVJ4OJy30Z5m1jaueMyDev8I4zazEfk1fpjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
	b=CIbEBy8YoZ0JvbBv6ZD234tsbO7ME3T//TCVeFr9ffWADvg1NfgBAon/VSAKitX99s10
	 Ltf82fJXr9NunHM2eP3mY9Tsafxkc3zTLNecwAZyUN99j63LVLD0Cx76VvuzG+8klm0NX
	 zIi7gpYpIoXGrNwMNR1MwMviZhjZZPn2eGIBCAaXm6NBypdua9SDPjTChXN1T6yIFjzjO
	 o9kegwCLoHlp0OWUmRs5UDcV5t0kedcYL7t9XS+q8IoZI9tbd0Ndm7HxnG6apfgnZg1Lt
	 eFrMo7zL4BiyDGhv3qL0zcl3zIt1bPk6GQb1slZ9S9gYYbPPO+6rmpg+9h71ZPxpO3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbh6Go9Q;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F83606A323
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 21:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F83606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbh6Go9Q
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb5e3cbf45so4871985e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556461; x=1796161261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=Vbh6Go9QrB6H0Ci+ICfsnVc/Vnpu7Z5MeztCGu0guAbvGlNHsrrPkk0VY3N1pD7MHC
         VheORaOhmiPJ6e5quiRTYcJm5iS7zGq+1Sbb37Ae74UDo75P8sxw/QyBrrTAoVpkFRym
         4sN0CqvmxdOnDEXqASm05sl0L5co+sBDSlRInJOxlAXsoKtWpDLmJ/DhPMlt4FqWJDqI
         Go6Y81x/DV6JJexZsaXT39ZqhZ4lFAlfA9BUdf4N/IwO7ncpQGwUBclACpDn6fhpL4A9
         icVhYxkXAUfD+s36UfHnwhkknLYY5slL/VA5KajX5FgwI0lPvYUFloKHo3eDGQK8vG+8
         E8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556461; x=1796161261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=IyiaTu8JrKwanO2btx4cD46TI+PlZSiXJ1X69srUp928mmSOhK2riN0sOohqQc1bu4
         OurCkz1V1bGD8GCgmPVdw3ohRns+u3zt7hvEdTEwpJaNHJTZ6TD0vgaAIsG57LFh2xQa
         NOd2R/0XvoaHnn3tiI1W4K+zGF8yTgq81QlU31z9F0O5B7WuRo+TLfRCVgdcUxH6oITN
         p2gkIWEW2VfSlPS/OvoGbmGQEDy5XN3q+3kvwK/aCRfgP4dn4qtm4SKdKEpuhqzCsek6
         7Oe8fY/O0BcESZechuzm3aPqH+7amnFmB0YsxcrPAjbhe5oc7cjcHoxC88J/nIlwpaX0
         0gcw==
X-Forwarded-Encrypted: i=1; AL+hErFGEN7kvVKtIiNWctrnaWn5uAvJeidIyCNyx7co1MJRzhXN3DuSerEkPC61IeWurA3XpwsWqazEx0PqeFk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Vh0D7LiO1Q/6GjGCLWznpk4ZaCe/sY1ZTwPckaOOhTLm3QqIz
	GxN/VF1uN94Ub2fx3geIM1tow+JwUizU4vOkQHJQB0GBZfFVqch6h4EC
X-Gm-Gg: AZFdTZcUKg4m9GAY4IfRKsFfXqhCxpdQY5zhZl9gohUnLz9rDlhkSnHCvn4cPRfkXLn
	I4dk35o0rfVJZCdIXJMWRfbgm3PA2ttUagBwDnZkxU5nQRzc6Xi/oQnM6L1kc/n0GXT76tFq5+X
	ckcXcPaKaDh2ybtZNnXbXx9NFAHh2g1f6xGE+zI5sDiuriWG8YI4SCmI7qIh2mWzwEDP115T2AP
	fa1N3Jg8pwMGZkXFs1Vl3mvtJ9NKLRQ8t3qQdwxidwjFZbC0E3RwnErEvKkYy0Nm1IU8+1l+HmT
	TMUJ2YkfgZ3TjfYgrbNXv54LbaUxOJEU5MRtUFasB7twJ14JyC0NemWJSCt3tFObbN8am7xU0W7
	WLffNFSw/T9WWejmTBTxrPR0tK7BvPP7sD3fb3VQ9nJGmpLJjKWXEio6LUJuJqpx0iKXF5FtMWW
	mxHVsH7ng6IlgLVoBOZrw+mqM6qDhB/2O9H9d3WTo2cBrWTAVKvH4yfiyjEbufZOv+WU3+dtNjm
	NYDjeNRfAIaKZeiBabAAbttRKPHu3PX40xc7pUUVt1xH7EgaNsIMpqlJJA40xDVeIubWneKoCxf
	BAr2l7T1jO+p38M6kirmABoC25GiMl7Z6AobXKxMXyMoF9Bjn9dskmIZ+QjX7tQ29qXFTg==
X-Received: by 2002:a5d:5888:0:b0:4a6:d298:832b with SMTP id ffacd0b85a97d-4abb6095e39mr30672204f8f.6.1795556461284;
        Tue, 24 Nov 2026 13:41:01 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:41:00 -0800 (PST)
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
Subject: [PATCH net-next v7 2/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:40:25 +0100
Message-ID: <20261124214025.11603-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
@@ -473,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 tx 2 2>/dev/null
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 1 tx 2 2>/dev/null
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
-	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
-		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
+		section xdp 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -483,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
-	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	CUR_RX=2
 	CUR_TX=2
 fi
 
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
-	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

