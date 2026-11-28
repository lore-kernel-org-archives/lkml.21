Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883133;
	b=bTM9nP2MJ9sjdB+XiX3wXeXUO4ifCp7G9TS0PZAyblsMAK9EteeBc1z6nhfCUeI6D6p1
	 izpOXZtn5lJ4GsPfBolF2Utfpjf+OlEJfiry2n6RSHTDrmgE7lcUImiVON8uK89/5/+DL
	 Jv1wMNOHj9zN8tIIcnOtxC9UDYL/fjU87R62B6ia5VN0HiexPxxCkRis3ZroxQbh+lGw4
	 I+Sf2vJK9tYaJudNeiL1+D+j1l7GI2ZN4OkUcb+LrxBigFqvsRvWFZQ82kcgKGp+Dr/6h
	 fIxqkUjlRGekwJfchEQd8RGQa6tKSY+vQu1a/bHj8LuZLoOxUf3SzK4oKQtQqK3+7Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=27dDFL7wVMW15bzHnm2/1q7smAv1Zk9BUXTu+eRE62g=;
	b=BZbWpwZNnfzbU1Qmtn4D2rqy4fs58QsVIyBX2cpVEToXWP/15nYA6KjTgfdBnDu8R9Gc
	 0dqr2goyofA2///SLy3qUClJJIx0Btj7+8BCjDG586tmoqtkH0zdVms2y3rFth/fjFJAC
	 msV1IcxkqYvM5MGXgh0oRmJkb72l7Uw9qFlSOV0iwtqaALjfC0oSnMXcSPpsu20y4yD+x
	 MFPkWY66N8BjxOI4vSoNjlUS+PBC2qRuapxA+yEzkZhAVOKpUH5EM3MpXZtFTmyFJeMAB
	 Nj9UkbQTJxbUmQzglvMBqv2dae7pYBbWHhcWHGjm4ssmpbjPn1goY3zWsYx+VaJsV4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFam3IHd;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7C8606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 16:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC7C8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jFam3IHd
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so60002475e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795883131; x=1796487931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=27dDFL7wVMW15bzHnm2/1q7smAv1Zk9BUXTu+eRE62g=;
        b=jFam3IHd1+VDEwi4UaJqB3cdEMQKutn8JdiF9EAH+WeSISmmQdLI2oHWwBJA2k0ksg
         4t/GEWXbc7y8Fl+j3ZzI/VsuNlq/YMZZwJqb9VPKPnzZA+vp0DGGcxwDIJtceU2iEXsf
         ItzPfwo9jXH/G64TsJUUDzZGk0DKs+uZ+BKgu83LMWdKShDlB5G2xeDLhJ2LjfM5ZqSw
         0Qo1PDNLD9CjredoLz+PdkN4MW3Pj2mkl7bND0+1P+MIU7rpe1/I4eQzgRDKUjkooc5S
         bzSP13rXbcLIU+oAnSDer/zKSHJneL6epSJXkS/WTndvBtghxeo6WsQuOTOqZErrHPRa
         bjLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795883131; x=1796487931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27dDFL7wVMW15bzHnm2/1q7smAv1Zk9BUXTu+eRE62g=;
        b=dO+n+g796EVnMBQ63BwuNd/u58zix40i0BvoGTz+l6wngh+s/PhjUqLCUC9gMu6Lc8
         Q4VsjY1y6p7KYcUQFq0oFA/gqfICQA7McaYAXcIdK/3pq/IVk5vL4n5XI1+BHRPMVohn
         nZSCj1RYzhiWg92CxP7ztDjy+mcLsAWt3xCNFFI2ZUTlq67Lzst0JO9/d6FsWZqIwI0F
         4YI7JkxMssV4Vmr8Pjx2RjcBDblQu8YryUwCkTWN3i9brzcJX0Ewbk+PkwpVMkQifgj1
         8jewZFIDV7vvrRE1v/EruwVdtIs/D78hFENjbqpLHhdtxxH1SD7E2v17V3wKnYTBkftd
         tPRQ==
X-Forwarded-Encrypted: i=1; AL+hErEfQ9dTqNvR+pWxv/zzGiDy0lQWuH1WetEbWu/O/OJ7lrKNjAo1Kiy+DqXP3Tbc08eYX+GY20hRREjclLk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/06jk+Z4jsfQrqDV+Uab2uu5QzvUnKyDMQ5vsLBP7mAN9FVP5A
	V5DiOB3vKFkG/5cV5qhap4nOSSLQNFYRr5ExX8D5dS1Go71TPk9q6FbL
X-Gm-Gg: AZFdTZciTXlLNDi0ngj7tzJ59943u4XFE0QZIYNtYcBkhk0MIsDBHXwuyjq3elrBlOM
	Efzgo3412BAtexEaQdY2qcGl2WhYdN9XE4E44JCtd49XE1yBbpKE3l3IUPqE11aahiKDQUkOvUM
	vPuFwZejDbcqaX1BMLS4gPNlkCRM2vm53Bgp9uV/Qbmqyyqy17m2iCr4detEzvPCr/etZI+LEw0
	y79lpf4545UIctWIbE17Q8oyvKmlLvCluLZWLoz0Bu3Oy6gO+IU8ei9ivOSLazujW+GjHWMhFro
	XvrbaU2dY4SuwNsuuKN/3Nj8KjqGCFHB/nZa7oXgOh/RPf7SJxwexFNBAfVBn/80hyHHLXdG7AH
	RI6EgikDoH1fyyDOTVqRcfL8mgA/hxn+/2d7zkQeu/P1clMF+GWVMJVFUXQpp2dzs+wppPBe3KS
	Vhet5/aOqIh5mfK5rYqutiJPoJxZ1EKYADB/z1Sv+aY99gQ92j1xWvrQ64EU9NJOY5RPSoODEdq
	qfv9PyYQIC6iJXJX42v8FZjTZOtvkMpAZprOavfKdqi6mS+hcqU76J0abHQXv/haTYH3b5r4buu
	uYZoN79sajXB5el5FxdkuoVgzRlRejxOZp8yvkOV2wWedna1k59A3ny1sO3+8kVO5QPLJMQGTyu
	2xPoour9j6u0ZaLfNNSODoiwI/VMUst5qyu79GR8=
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4bb8881f9b7mr599004195e9.34.1795883130105;
        Sat, 28 Nov 2026 08:25:30 -0800 (PST)
Received: from kernel.. ([191.40.25.3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm456446595e9.3.2026.11.28.08.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:25:29 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	josh@joshtriplett.org,
	joelagnelf@nvidia.com,
	boqun@kernel.org
Cc: rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] rcutorture: Honor explicit QEMU CPU selection
Date: Sun, 29 Nov 2026 00:25:11 +0800
Message-ID: <20261128162511.3768408-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
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

kvm-test-1-run.sh appends the default -cpu after the arguments from
--qemu-args. QEMU uses the last -cpu, so the default can override
an explicit selection such as -cpu host,pmu=on.

Emit the default -cpu before the user arguments and keep the other
arguments in their original order.

Fixes: a6fda6dab93c ("rcutorture: Tweak kvm options")
Fixes: 67ad71ddbcae ("rcutorture: Add basic ARM64 support to run scripts")
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
All 17 shell tests passed. On x86 KVM with QEMU 8.2.2, QMP reported
kvm64 with pmu=false before the patch and host with pmu=true after
it. Both runs passed -cpu host,pmu=on and started paused (-S).

 .../rcutorture/bin/functions-test.sh          | 94 +++++++++++++++++++
 .../selftests/rcutorture/bin/functions.sh     | 20 ++--
 .../rcutorture/bin/kvm-test-1-run.sh          |  4 +-
 3 files changed, 108 insertions(+), 10 deletions(-)
 create mode 100755 tools/testing/selftests/rcutorture/bin/functions-test.sh

diff --git a/tools/testing/selftests/rcutorture/bin/functions-test.sh b/tools/testing/selftests/rcutorture/bin/functions-test.sh
new file mode 100755
index 0000000000000..92edbed889576
--- /dev/null
+++ b/tools/testing/selftests/rcutorture/bin/functions-test.sh
@@ -0,0 +1,94 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Check the order of arguments emitted by identify_qemu_args().
+# Usage: functions-test.sh [functions.sh]
+#
+# Author: Kunwu Chan <kunwu.chan@gmail.com>
+
+set -efu
+
+scriptdir="$(cd -- "$(dirname -- "$0")" && pwd)"
+. "${1:-$scriptdir/functions.sh}"
+
+TORTURE_QEMU_INTERACTIVE=
+TORTURE_QEMU_MAC=
+console=/tmp/functions-test-console.log
+serial="-serial file:$console"
+nchecks=0
+nerrors=0
+
+check_qemu_args () {
+	local label="$1"
+	local qemu="$2"
+	local expected="$3"
+	local args
+
+	shift 3
+	args=$(identify_qemu_args "$qemu" "$console" "$@")
+	# Normalize whitespace as when the harness writes qemu-cmd.
+	set -- $args
+	nchecks=$((nchecks + 1))
+	if test "$*" = "$expected"
+	then
+		echo "ok $nchecks - $label"
+	else
+		echo "not ok $nchecks - $label"
+		printf '# expected: %s\n# got:      %s\n' "$expected" "$*"
+		nerrors=$((nerrors + 1))
+	fi
+}
+
+for arch in x86_64 i386 aarch64
+do
+	case "$arch" in
+	x86_64)
+		cpu=kvm64
+		machine=q35,accel=kvm
+		;;
+	i386)
+		cpu=kvm32
+		machine=q35,accel=kvm
+		;;
+	aarch64)
+		cpu=host
+		machine=virt,gic-version=host
+		;;
+	esac
+	tail="-machine $machine $serial"
+	check_qemu_args "$arch default CPU" "qemu-system-$arch" "-cpu $cpu $tail"
+	args="-smp 4 -net none -nodefaults"
+	check_qemu_args "$arch unrelated options" \
+		"qemu-system-$arch" "-cpu $cpu $args $tail" "$args"
+	args="-smp 4 -cpu host,pmu=on -nodefaults"
+	check_qemu_args "$arch explicit CPU" \
+		"qemu-system-$arch" "-cpu $cpu $args $tail" "$args"
+done
+
+tail="-machine q35,accel=kvm $serial"
+check_qemu_args "CPU token as guest name" qemu-system-x86_64 \
+	"-cpu kvm64 -name -cpu $tail" "-name -cpu"
+check_qemu_args "guest name and tab-separated --cpu" qemu-system-x86_64 \
+	"-cpu kvm64 -name -cpu --cpu host,pmu=on $tail" $'-name -cpu\t--cpu\thost,pmu=on'
+args="-cpu host,pmu=off --cpu host,pmu=on"
+check_qemu_args "multiple explicit CPU options" qemu-system-x86_64 \
+	"-cpu kvm64 $args $tail" "$args"
+args="-machine q35,usb=off -serial none"
+check_qemu_args "machine and serial ordering" qemu-system-x86_64 \
+	"-cpu kvm64 $args $tail" "$args"
+check_qemu_args "custom QEMU command" /opt/qemu/bin/qemu-system-x86_64 \
+	"-name test $serial" "-name test"
+ppc="-M pseries -nodefaults -device spapr-vscsi"
+check_qemu_args "ppc64 defaults" qemu-system-ppc64 "$ppc $serial"
+
+TORTURE_QEMU_INTERACTIVE=1
+serial="-monitor stdio -serial pty -S"
+check_qemu_args "x86_64 interactive" qemu-system-x86_64 \
+	"-cpu kvm64 -cpu host,pmu=on -machine q35,accel=kvm $serial" "-cpu host,pmu=on"
+TORTURE_QEMU_MAC=02:00:00:00:00:01
+ppc="$ppc -device spapr-vlan,netdev=net0,mac=$TORTURE_QEMU_MAC"
+check_qemu_args "ppc64 interactive with MAC" qemu-system-ppc64 \
+	"$ppc -netdev bridge,br=br0,id=net0 $serial"
+
+echo "1..$nchecks"
+test "$nerrors" -eq 0
diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
index 6e415ddb206f3..7fa760073fb30 100755
--- a/tools/testing/selftests/rcutorture/bin/functions.sh
+++ b/tools/testing/selftests/rcutorture/bin/functions.sh
@@ -227,27 +227,31 @@ identify_qemu_append () {
 	fi
 }
 
-# identify_qemu_args qemu-cmd serial-file
+# identify_qemu_args qemu-cmd serial-file [qemu-args]
 #
-# Output arguments for qemu arguments based on the TORTURE_QEMU_MAC
-# and TORTURE_QEMU_INTERACTIVE environment variables.
+# QEMU uses the last -cpu option, so emit the default before qemu-args.
 identify_qemu_args () {
-	local KVM_CPU=""
 	case "$1" in
 	qemu-system-x86_64)
-		KVM_CPU=kvm64
+		echo -cpu kvm64
 		;;
 	qemu-system-i386)
-		KVM_CPU=kvm32
+		echo -cpu kvm32
+		;;
+	qemu-system-aarch64)
+		echo -cpu host
 		;;
 	esac
+	if test -n "${3-}"
+	then
+		printf '%s\n' "$3"
+	fi
 	case "$1" in
 	qemu-system-x86_64|qemu-system-i386)
 		echo -machine q35,accel=kvm
-		echo -cpu ${KVM_CPU}
 		;;
 	qemu-system-aarch64)
-		echo -machine virt,gic-version=host -cpu host
+		echo -machine virt,gic-version=host
 		;;
 	qemu-system-ppc64)
 		echo -M pseries -nodefaults
diff --git a/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh b/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh
index 957800c9ffbad..02164b6229a24 100755
--- a/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh
+++ b/tools/testing/selftests/rcutorture/bin/kvm-test-1-run.sh
@@ -153,8 +153,8 @@ fi
 qemu_args="`specify_qemu_cpus "$QEMU" "$qemu_args" "$cpu_count"`"
 qemu_args="`specify_qemu_net "$qemu_args"`"
 
-# Generate architecture-specific and interaction-specific qemu arguments
-qemu_args="$qemu_args `identify_qemu_args "$QEMU" "$resdir/console.log"`"
+# Place the default CPU before existing arguments and append the other defaults.
+qemu_args="`identify_qemu_args "$QEMU" "$resdir/console.log" "$qemu_args"`"
 
 # Generate qemu -append arguments
 qemu_append="`identify_qemu_append "$QEMU"`"

base-commit: 68dcfb0e34ee3a9628f6b5ce7e06931b5248bb9e
-- 
2.43.0

