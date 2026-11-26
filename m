Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.38
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674487;
	b=b4QnbZYLh09V57sXs0SaRxA3doEZPmttZLxmnR4W6ugD189J33XSOy/U+NwnlI6e4EvT
	 scqC+KVJ3Ova9dmENwNUX0A9NtWxzeJXt08HQ4CsKMDOenBnveBMYMv6sePuSBb2doSfJ
	 LCOGG0y1OeD2v06wTeiTTLzih6ByhZq2ckuLJR4m1m3wjaxkCBpuMHU8Jbti/VCOvtaXJ
	 Gu9jiPZKt0xChUtouugBCM9/97i0FRtNigCyl43YsFee80YrwgGv0vjhE1EW8fAAW4T7A
	 k2TL3vyym7mfl5X/WvHv3l9Fzxe3XWPjSSPPrbSgfKORfiwcsK0UlHheimUDGGdJ9jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674487;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=kL06f/X8F0pCUsRpt4OdaQK/VJzX2vhlrvqULYx75ac=;
	b=Be2mT/adhKCViyaVYbE8003gpYf/iVTSgMKkpH9CAGl1xNEhPkdjN42DjfO5ZS55v8X2
	 NDjs2xbd9xKdR7Dh5vYq5ki7IgEmnEp+ARlDYcHkKzROrxDewbqGdL+/f0Q1A+alTGNKX
	 7i6pnUSBdNFBu2FGt8O7xGl1lB/rg7TDqtW/MYE5e2IEkJQCgpll569IiClAmFxvlBNs2
	 qc/5aR5AcWUAHFBJQ4JxzJ6ZiyyZk0v1AFX6QtAU6bTjO2DGlaxdWWB/Lr4/NoHu75KUG
	 AxdNA8NEGJY8aKY/uzQBPgeOqZFjPTa0vUDsbp0E0yD0cDTr3u/v461fDkTqxkZKXiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l2AOE5O9;
	arc=none smtp.remote-ip=91.218.175.38
Received: from mta0.migadu.com (out-38.mta0.migadu.com [91.218.175.38])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865BC606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 06:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 865BC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l2AOE5O9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=it30w/qv5FXVyLwZWDrrsl536DanKovgZRDzj670pbM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795674484; v=1; x=1796279284;
 b=l2AOE5O9KxBpLDeUwnXv8ULy3hH4RvzFCrxUoP7DS15h9rJTxnvpwnLgofmS1kyWo9dlHdDp
 1AB5mN0w8NnY2UVV8vTMpk/jfIXgBBuYPK5pmKu8SVDFVMOF6MKHlQqHuOSxuwUagYlgQ6VARU3
 uFzux9ZtL73BbbJfdcmtJW34=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 3d58059a4f084852;
	Thu, 26 Nov 2026 06:28:04 +0000
X-Mizu-Trace-ID: 3d58059a4f084852
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Thu, 26 Nov 2026 14:27:26 +0800
Subject: [PATCH net-next v5 4/5] selftests: seg6: explicit cleanup for SRv6
 End PSP test
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-srv6_flavors_endx-v5-4-4d8232eec404@kylinos.cn>
References: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
In-Reply-To: <20261126-srv6_flavors_endx-v5-0-4d8232eec404@kylinos.cn>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 Andrea Mayer <andrea@common-net.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Hangbin Liu <hangbin.liu@linux.dev>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

The End PSP tests install policy and localsid state but rely on the
global namespace teardown to remove it. That leaves flavor-specific
state behind once more tests share this script.

Use the defer helper to remove the configurations installed for the
PSP tests:

  * cafe::1, cafe::1:e9, cafe::2, cafe::2:e9 routes and proxy neighs
    on rt1, rt2, and the cafe::1:e9, cafe::2:e9 addresses on the
    hosts' loopback
  * fcbb:0:x0e9::/48 End next-csid,psp policies on rt 1,2,3,4
  * fcff:x::0ef1 End psp policies on rt 1,2,4

After the change, we can wrap the whole end test with test_end_flv()
and run it separately.

Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 .../testing/selftests/net/srv6_end_flavors_test.sh | 29 ++++++++++++++++------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/srv6_end_flavors_test.sh b/tools/testing/selftests/net/srv6_end_flavors_test.sh
index 250de54d8bfa..9d6b7de648da 100755
--- a/tools/testing/selftests/net/srv6_end_flavors_test.sh
+++ b/tools/testing/selftests/net/srv6_end_flavors_test.sh
@@ -763,6 +763,8 @@ setup_rt_endpoint()
 		add "${sid}" table "${LOCALSID_TABLE_ID}" \
 		encap seg6local action ${behavior_cfg} \
 		dev "${DUMMY_DEVNAME}"
+	defer ip -netns "${nsname}" -6 route \
+		del "${sid}" table "${LOCALSID_TABLE_ID}"
 }
 
 # Add an SRv6 Endpoint behavior to each router of a Policy element <nodeid:op>.
@@ -865,10 +867,15 @@ __setup_rt_policy()
 		add "${IPv6_HS_NETWORK}::${dst}" \
 		encap seg6 mode inline segs "${policy}" \
 		dev "${DUMMY_DEVNAME}"
+	defer ip -netns "${in_nsname}" -6 route \
+		del "${IPv6_HS_NETWORK}::${dst}"
 
 	ip -netns "${in_nsname}" -6 neigh \
 		add proxy "${IPv6_HS_NETWORK}::${dst}" \
 		dev "${RT2HS_DEVNAME}"
+	defer ip -netns "${in_nsname}" -6 neigh \
+		del proxy "${IPv6_HS_NETWORK}::${dst}" \
+		dev "${RT2HS_DEVNAME}"
 }
 
 # see __setup_rt_policy
@@ -929,10 +936,12 @@ setup_hs_lo_addr()
 	addr="${IPv6_HS_NETWORK}::${hs}:${suffix}"
 
 	ip -netns "${hsname}" addr add "${addr}/128" dev lo nodad
+	defer ip -netns "${hsname}" addr del "${addr}/128" dev lo nodad
 
 	ip -netns "${rtname}" -6 route \
 		add "${addr}" \
 		via "${IPv6_HS_NETWORK}::${hs}" dev "${RT2HS_DEVNAME}"
+	defer ip -netns "${rtname}" -6 route del "${addr}"
 }
 
 setup()
@@ -1412,6 +1421,18 @@ test_dummy_dev_or_ksft_skip()
 	ip netns del "${test_netns}"
 }
 
+test_end_flv()
+{
+	defer_scope_push
+	set -e
+	setup_end_flv_psp
+	set +e
+	host_srv6_end_flv_psp_tests
+	host_srv6_end_flv_next_csid_psp_tests
+	host_srv6_end_flv_consumed_srh_tests
+	defer_scope_pop
+}
+
 if [ "$(id -u)" -ne 0 ]; then
 	echo "SKIP: Need root privileges"
 	exit "${ksft_skip}"
@@ -1443,11 +1464,5 @@ set +e
 router_tests
 host2gateway_tests
 
-set -e
-setup_end_flv_psp
-set +e
-host_srv6_end_flv_psp_tests
-host_srv6_end_flv_next_csid_psp_tests
-host_srv6_end_flv_consumed_srh_tests
-
+test_end_flv
 print_log_test_results

-- 
2.56.0

